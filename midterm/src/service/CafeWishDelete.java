package service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeDao;
import dao.ImageDao;
import dao.WishListDao;
import model.Cafe;
import model.Image;
import model.WishList;


public class CafeWishDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		WishList check = new WishList();
		check.setCafe_id(Integer.parseInt(request.getParameter("cafe_id")));
		check.setMember_id(request.getParameter("member_id"));
		WishListDao wld = WishListDao.getinstance();
		List<WishList> wishlist = wld.select(check);
		int result = 0;
		if (wishlist.isEmpty()) { //wishlist에 추가
			result = wld.insert(check);
		} else { //wishlist에서 제거
			result = wld.delete(wishlist.get(0));
		}
		String member_id = request.getParameter("member_id");
		
		CafeDao cd = CafeDao.getInstance();
		List<Cafe> cafeList = new ArrayList<Cafe>();
		
		ImageDao igd = ImageDao.getInstance();
		List<Image> imageList = new ArrayList<Image>();

		for (int i=0;i<wishlist.size();i++) {	
			//wish리스트의 cafe_id만큼 뺴내온다
			Cafe cafe = cd.select(wishlist.get(i).getCafe_id());
			int cafe_id = cafe.getCafe_id();
			cafeList.add(cafe);
			imageList.add(igd.selectMainCafe(cafe_id));			
		}
		request.setAttribute("wishResult", result);
		request.setAttribute("wishList", wishlist);
		request.setAttribute("cafeList", cafeList);
		request.setAttribute("imageList", imageList);
		request.setAttribute("member_id", member_id);
		return "mypage/deleteWishListConfirm";
	}

}
