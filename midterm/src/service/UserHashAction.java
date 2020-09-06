package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeLinkDao;
import dao.HashtagDao;
import model.CafeLink;
import model.Hashtag;

public class UserHashAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		// user등록 해시태그
		String hash_name = request.getParameter("user_hash"); // 유저 입력값
		HashtagDao hd = HashtagDao.getInstance();
		Hashtag hashtag = hd.selectNameCheck(hash_name); // 중복체크
		int result = 0;
		System.out.println(hash_name);
		if (hashtag == null) { // 유저가 입력한 해시태그명이 없으면
			
			// 새로운 해시태그로 등록
			hd.insert(hash_name); 
			Hashtag userHash = hd.selectId(hash_name);
			
			// 카페와 멤버 해시태그 연결(카페링크 생성)
			CafeLink cafelink = new CafeLink(); 
			cafelink.setCafe_id(Integer.parseInt(request.getParameter("cafe_id")));
			cafelink.setMember_id(request.getParameter("member_id"));
			cafelink.setHash_id(userHash.getHash_id());
			
			CafeLinkDao cld = CafeLinkDao.getInstance();
			cld.insertByMember(cafelink);
		
		} else { // 유저가 입력한 해시태그가 이미 존재하는 이름이라면
			
			// 이미 카페링크도 생성되어있는지 중복체크 후
			CafeLink check = new CafeLink(); 
			check.setCafe_id(Integer.parseInt(request.getParameter("cafe_id")));
			check.setMember_id(request.getParameter("member_id"));
			check.setHash_id(hashtag.getHash_id());
			CafeLinkDao cld = CafeLinkDao.getInstance();
			CafeLink cafelink = cld.check(check);
			if (cafelink==null) { // 연결고리 없으면
				// 카페와 멤버 해시태그 연결(카페링크 생성)
				cld.insertByMember(check); 
			} else {
				System.out.println("이미등록");
				result=-1; // 이미 연결되어있다면 '이미 등록됐습니다' 알림?
			}
		}
		request.setAttribute("result", result); // 등록 후 어떻게?? (해시태그 목록에 다른 색으로 생성돼야함)
		return "searchDetail/userHash";
		
	}
}
	
