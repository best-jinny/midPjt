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

public class RankingAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// TOP 5 CAFE 호출
		CafeDao cd = CafeDao.getInstance();
		List<Cafe> cafeList = cd.selectTop5();
				
		// 4. 카페당 대표 이미지 하나씩 호출
		ImageDao id = ImageDao.getInstance();
		//String[] cafe_image = new String[cafeList.size()];
		HashMap<Integer, String> cafe_image = new HashMap<Integer, String>();
		for (int i=0;i<cafeList.size();i++) {
			int cafe_id = cafeList.get(i).getCafe_id();
			String img_path = id.selectMain(cafe_id);
			cafe_image.put(cafeList.get(i).getCafe_id(), img_path);
			System.out.println(cafeList.get(i).getCafe_name());
		}
		
		// 5. 해시태그 3개까지만 
		HashtagDao hd = HashtagDao.getInstance();
		CafeLinkDao cld = CafeLinkDao.getInstance();
		HashMap<Integer,List<String>> cafe_hash = new HashMap<Integer, List<String>>();
		HashMap<Integer,String> cafe_filter = new HashMap<Integer, String>();
		
		for (int i=0; i<cafeList.size();i++) {
			int cafe_id = cafeList.get(i).getCafe_id();
			List<CafeLink> hashidList = cld.selectList(cafe_id);
			List<String> hashlist = new ArrayList<String>();
			String hashString = new String();
			for (int j=0;j<hashidList.size();j++) {
				if (j>1) break;
				String hashtag = hd.selectName(hashidList.get(j).getHash_id());
				hashlist.add(hashtag);
				hashString += hashtag + " ";
			}
			cafe_hash.put(cafe_id, hashlist);
			cafe_filter.put(cafe_id, hashString);
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

		// 7. 검색 정렬 searchResult.jsp로 보내기
		request.setAttribute("cafeList", cafeList);			//카페 원하는 순서대로
		request.setAttribute("cafe_image", cafe_image);		//map: key=카페ID, value=img_path
		request.setAttribute("cafe_hash", cafe_hash);		//map: key=카페ID, value=hashtag list
		request.setAttribute("cafe_filter", cafe_filter);	//map: key=카페ID, value=hashtag string
		request.setAttribute("wishCafe", wishCafe);			//찜한 카페ID
		request.setAttribute("mapCoords", mapCoords);		//지도
		return "searchDetail/ranking";
	}

}
