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

public class CafeWishList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String member_id = request.getParameter("member_id");
		
		
		WishListDao wld = WishListDao.getinstance();
		List<WishList> wishlist = wld.list(member_id);
		
		CafeDao cd = CafeDao.getInstance();
		List<Cafe> cafeList = new ArrayList<Cafe>();
		
		ImageDao igd = ImageDao.getInstance();
		List<Image> imageList = new ArrayList<Image>();
		
		//유저 등록 해시
		HashtagDao hd = HashtagDao.getInstance();
		CafeLinkDao cld = CafeLinkDao.getInstance();
		List<CafeLink> hash_id_user = cld.selectListUser(member_id);
		List<Hashtag> hashList_user = new ArrayList<Hashtag>();
		for (int i=0;i<hash_id_user.size();i++) {
			hashList_user.add(hd.select(hash_id_user.get(i).getHash_id()));
		}
		
		// for (int i=0;i<wishlist.size();i++) {
		for (int i=0;i<wishlist.size();i++) {	
			//wish리스트의 cafe_id만큼 뺴내온다
			Cafe cafe = cd.select(wishlist.get(i).getCafe_id());
			int cafe_id = cafe.getCafe_id();
			Image image = igd.selectMainCafe(cafe_id);
			cafeList.add(cafe);			
			imageList.add(image);			
		}
		
		request.setAttribute("wishList", wishlist);
		request.setAttribute("cafeList", cafeList);
		request.setAttribute("imageList", imageList);
		request.setAttribute("member_id", member_id);
		request.setAttribute("hashList_user", hashList_user);
		
		return "mypage/wishList";
	}

}
