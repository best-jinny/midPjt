package service;

import java.util.ArrayList;
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
import model.Hashtag;
import model.Image;
import model.WishList;

public class CafeDetailAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String member_id = request.getParameter("member_id");
		int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
		CafeDao cd = CafeDao.getInstance();
		cd.updateReadCnt(cafe_id);
		
		ImageDao id = ImageDao.getInstance();
		Cafe cafe = cd.select(cafe_id);
		List<Image> list = id.select(cafe_id);
		
		HashtagDao hd = HashtagDao.getInstance();
		CafeLinkDao cld = CafeLinkDao.getInstance();
		
		//유저가 등록한 해시리스트 
		List<CafeLink> hash_id_user = cld.selectList1(cafe_id, member_id);
		List<Hashtag> hashList_user = new ArrayList<Hashtag>();
		for (int i=0;i<hash_id_user.size();i++) {
			hashList_user.add(hd.select(hash_id_user.get(i).getHash_id()));
		}
		//관리자 등록 해시리스트
		List<CafeLink> hash_id = cld.selectList2(cafe_id, member_id);
		List<Hashtag> hashList = new ArrayList<Hashtag>();
		for (int i=0;i<hash_id.size();i++) {
			hashList.add(hd.select(hash_id.get(i).getHash_id()));
		}
		//유사한 카페
		
		List<Integer> s_hashList = cld.selectHashCafe(cafe_id);
		
		List<CafeLink> s_cafe_id = cld.selectScafe(cafe_id, s_hashList);
		Cafe s_Cafe = cd.select(s_cafe_id.get(0).getCafe_id());
		List<Image> s_list = id.select(s_cafe_id.get(0).getCafe_id());
		
		
		// 6. 찜 내역 불러오기
		WishList wishCafe = new WishList();
		if (member_id!=null) {
			WishListDao wld = WishListDao.getinstance();
			wishCafe = wld.insertChk(member_id, cafe_id);
		}
		request.setAttribute("cafe", cafe);
		request.setAttribute("list", list);
		request.setAttribute("hashList", hashList);
		request.setAttribute("hashList_user", hashList_user);
		request.setAttribute("wishCafe", wishCafe);
		request.setAttribute("s_Cafe", s_Cafe); 
		request.setAttribute("s_list", s_list); 

		return "searchDetail/cafeDetail";
	}

}
