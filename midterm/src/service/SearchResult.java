package service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeDao;
import dao.CafeLinkDao;
import dao.HashtagDao;
import dao.ImageDao;
import dao.WishListDao;
import model.Cafe;
import model.CafeLink;
import model.WishList;

public class SearchResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		// 0. Initial Setup
		
		// 검색 결과 읽음
		String resultWhole = request.getParameter("result");
		String subject = request.getParameter("subject");
		String[] resultList = resultWhole.split(",");
		
		// CafeDao 인스탄스 생성
		CafeDao cd = CafeDao.getInstance(); 
		List<Cafe> cafeList = new ArrayList<Cafe>();
	  
		// 검색 정렬기준 읽음, 선택 안한 경우 자동으로 관련도순
		String order = request.getParameter("order"); 
		if (order==null||order.equals("")) order="rel";
		System.out.println(order);
	  
		List<Cafe> cafePreorder = new ArrayList<Cafe>();
		List<Integer> cafeIdPreorder = new ArrayList<Integer>();
		for (String result:resultList) {
			cafePreorder.add(cd.select(Integer.parseInt(result)));
			cafeIdPreorder.add(Integer.parseInt(result));
		}

		// 3. 선택한 정렬 기준 따라 카페 정렬
		// 3-1. 관련도순 (relativity) 
		if (order.equals("rel")) {
			cafeList.addAll(cafePreorder);
		// 3-2. 새로 등록된 카페순 (newest) 
		} else if (order.equals("new")) { 
			cafeList = cd.newest(cafeIdPreorder); 
		// 3-3. 관심 많은 순 (readcount highest) 
		} else { 
			cafeList = cd.hottest(cafeIdPreorder); 
		}
		
		// 4. 카페당 대표 이미지 하나씩 호출
		ImageDao id = ImageDao.getInstance();
		//String[] cafe_image = new String[cafeList.size()];
		HashMap<Integer, String> cafe_image = new HashMap<Integer, String>();
		for (int i=0;i<cafeList.size();i++) {
			int cafe_id = cafeList.get(i).getCafe_id();
			String img_path = id.selectMain(cafe_id);
			cafe_image.put(cafeList.get(i).getCafe_id(), img_path);
		}
		
		// 5. 관련도순 높은 카페 3개의 해시태그 3개까지만 
		HashtagDao hd = HashtagDao.getInstance();
		CafeLinkDao cld = CafeLinkDao.getInstance();
		HashMap<Integer,List<String>> cafe_hash = new HashMap<Integer, List<String>>();
		HashMap<Integer,String> cafe_filter = new HashMap<Integer, String>();
		List<String> topHash = new ArrayList<String>();
		for (int i=0; i<cafePreorder.size();i++) {
			int cafe_id = cafePreorder.get(i).getCafe_id();
			List<CafeLink> hashidList = cld.selectList(cafe_id);
			List<String> hashlist = new ArrayList<String>();
			String hashString = new String();
			for (int j=0;j<hashidList.size();j++) {
				if (j>1) break;
				String hashtag = hd.selectName(hashidList.get(j).getHash_id());
				hashlist.add(hashtag);
				hashString += hashtag + " ";
				if (i<=2) {
					topHash.add(hashtag);
				}
			}
			cafe_hash.put(cafe_id, hashlist);
			cafe_filter.put(cafe_id, hashString);
		}
		
		// 5-1. 해시태그 중복제거
		 for (int j=0;j<topHash.size();j++) { 
			 for (int i=topHash.size()-1;i>j;i--) { 
				 if(topHash.get(j)==topHash.get(i)) {
					 topHash.remove(i);
				 }
			 }
		 }
		
		// 6. 찜 내역 불러오기
		String member_id = request.getParameter("member_id");
		List<Integer> wishCafe = new ArrayList<Integer>();
		if (member_id!=null) {
			WishListDao wld = WishListDao.getinstance();
			List<WishList> wishlist = wld.list(member_id);
			for (WishList wish:wishlist) {
				for (Cafe cafe:cafeList) {
					if (wish.getCafe_id()==cafe.getCafe_id()) {
						wishCafe.add(wish.getCafe_id());
					}
				}
			}
		}
		
		// 7. 지도 불러오기
		List<String> mapCoords = new ArrayList<String>();
		for (Cafe cafe:cafeList) {
			mapCoords.add(cafe.getCafe_map());
		}
		
		// 8. 검색 정렬 searchResult.jsp로 보내기
		request.setAttribute("topHash", topHash);			//관련도 높은 카페 3개의 해시태그 3개씩
		request.setAttribute("subject", subject);			//검색한 단어
		request.setAttribute("cafeList", cafeList);			//카페 원하는 순서대로
		request.setAttribute("cafe_image", cafe_image);		//map: key=카페ID, value=img_path
		request.setAttribute("cafe_hash", cafe_hash);		//map: key=카페ID, value=hashtag list
		request.setAttribute("cafe_filter", cafe_filter);	//map: key=카페ID, value=hashtag string
		request.setAttribute("wishCafe", wishCafe);			//찜한 카페ID
		request.setAttribute("mapCoords", mapCoords);		//지도
		request.setAttribute("originalOrder", order);
		return "search/searchResult";
	}

}
