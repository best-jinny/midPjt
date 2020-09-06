package service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeDao;
import dao.CafeLinkDao;
import dao.HashKindDao;
import dao.HashLinkDao;
import dao.HashtagDao;
import dao.ImageDao;
import dao.WishListDao;
import model.Cafe;
import model.CafeLink;
import model.HashKind;
import model.HashLink;
import model.Hashtag;
import model.WishList;


public class SearchAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		/* final long startTime = System.currentTimeMillis(); */
		List<Cafe> loopList = new ArrayList<Cafe>();
		String member_id=request.getParameter("member_id");
		
		// subject: 검색한 단어
		String search = request.getParameter("subject");
		String[] subjectList = search.split(" ");
		
		for (String subject:subjectList) {
			// 1. 	Searching through hashkind names to see if there are
			// 		any matches with search "subject"
			HashKindDao hkd = HashKindDao.getInstance();
			List<HashKind> listHkd = hkd.search(subject);
			
			// 2. 	Connecting hashkind with hashtag though hashlink
			HashLinkDao hld = HashLinkDao.getInstance();
			List<HashLink> listHl = hld.identify(listHkd);
			HashtagDao hd = HashtagDao.getInstance();
			List<Hashtag> listHd = hd.identify(listHl);
			
			// 3. 	Searching through hashtag names to see if there are
			// 		any matches with search "subject"
			List<Hashtag> listHdSearch = hd.search(subject);
			
			// 4.	Combining the two hashtag lists into one
			listHdSearch.addAll(listHd);
			
			// 5.	Connecting hashtag with cafes through cafelink
			CafeLinkDao cld = CafeLinkDao.getInstance();
			List<CafeLink> listCld = cld.identify(listHdSearch,member_id);
			CafeDao cd = CafeDao.getInstance();
			List<Cafe> resultCheck = cd.identify(listCld);
			
			// 6. 	Searching through cafe names to see if there are
			//		any matches with search "subject"
			List<Cafe> listCd = cd.search(subject);
			
			// 7. 	Combining the two cafe lists into one
			for (Cafe cafe:resultCheck) {
				listCd.add(cafe);
			}
			
			// 8. 	Save final list from search word subject[i] to result
			for (Cafe cafe:listCd) {
				loopList.add(cafe);
				/* System.out.println(cafe.getCafe_name()); */
			}
		}
		////////////////SubjectResult.java의 filtering/결과 print Logic//////////////////
		//////////////////////////////////////////////////////////////////////////////
		
		// 중복된 카페 저장할 리스트 생성 
		List<Integer> cafeRel = new ArrayList<Integer>();
		
		// Run below SearchResult logic only if result is not empty
		if (loopList!=null) {
			
			// 1. 카페 중복제거 / 중복된카페 저장
			List<Cafe> resultList = new ArrayList<Cafe>();
			List<Integer> resultIdList = new ArrayList<Integer>();
 			for (int j=0;j<loopList.size();j++) { 
				 if (!resultIdList.contains(loopList.get(j).getCafe_id())) {
					 resultIdList.add(loopList.get(j).getCafe_id());
				 } else {
					 cafeRel.add(loopList.get(j).getCafe_id());
				 }
			}
			CafeDao cd = CafeDao.getInstance();
			for (int i:resultIdList) {
				resultList.add(cd.select(i));
			}

			 HashMap<Integer,Integer> map = new HashMap<Integer, Integer>();
			 for (int j=0;j<resultList.size();j++) {
				 int rep = 0;
				 for (int i=0;i<cafeRel.size();i++) {
					 if (cafeRel.get(i)==resultList.get(j).getCafe_id()) {
						 rep++;
					 }
				 }
				 map.put(resultList.get(j).getCafe_id(),rep);
			 }
			 
			// 2. 관련도 순 카페 리스트 만들기
			List<Integer> keyList = new ArrayList<Integer>(map.keySet());
			List<Cafe> relCafeList = new ArrayList<Cafe>();
			Collections.sort(keyList, new Comparator<Integer>() {
				public int compare(Integer o1, Integer o2) {
					return map.get(o2).compareTo(map.get(o1));
				}
			});
			
			for (Integer key:keyList) {
				relCafeList.add(cd.select(key));
			}
			
			// save cafe_id list in String format
			String result = new String();
			for (int i=0;i<relCafeList.size();i++) {
				if (i==relCafeList.size()-1) {
					result += (relCafeList.get(i).getCafe_id());
				} else result += (relCafeList.get(i).getCafe_id()) + ",";
			}
			
			// 0. Initial Setup
			
			/*
			 * // 검색 결과 읽음 String[] resultList1 = result.split(",");
			 */
			
			// CafeDao 인스탄스 생성
			//CafeDao cd = CafeDao.getInstance(); 
			
			// 3. 선택한 정렬 기준 따라 카페 정렬
			// 3-1. 관련도순 (relativity) 
			List<Cafe> cafeList = new ArrayList<Cafe>();				//카페
			List<Integer> cafeIdPreorder = new ArrayList<Integer>();	//카페ID
			for (Cafe cafe:relCafeList) {
				cafeList.add(cafe);
				cafeIdPreorder.add(cafe.getCafe_id());
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
			request.setAttribute("cafeList", cafeList);			//카페 원하는 순서대로
			request.setAttribute("cafe_image", cafe_image);		//map: key=카페ID, value=img_path
			request.setAttribute("cafe_hash", cafe_hash);		//map: key=카페ID, value=hashtag list
			request.setAttribute("cafe_filter", cafe_filter);	//map: key=카페ID, value=hashtag string
			request.setAttribute("wishCafe", wishCafe);			//찜한 카페ID
			request.setAttribute("mapCoords", mapCoords);		//지도
			request.setAttribute("result", result);
			//request.setAttribute("subject", search);
		} 
		request.setAttribute("subject", search);				//검색한 단어
		
		/*
		 * final long endTime = System.currentTimeMillis();
		 * System.out.println("Total execution time: " + (endTime - startTime));
		 */
		return "search/searchMain";
	}
}
