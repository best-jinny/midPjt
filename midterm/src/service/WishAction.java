package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.WishListDao;
import model.WishList;

public class WishAction implements CommandProcess {

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
		request.setAttribute("wishResult", result);
		return "search/wish";
	}

}
