package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.WishListDao;
import model.WishList;

public class WishInsertAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
		String member_id = request.getParameter("member_id");
		int result = 0;
		WishListDao wd = WishListDao.getinstance();
		WishList wishlist1 = wd.insertChk(member_id, cafe_id);
		if(wishlist1 == null) { // 중복체크 
			WishList wishlist = new WishList();
			wishlist.setCafe_id(cafe_id);
			wishlist.setMember_id(member_id);
			result = wd.insertCafe(wishlist);			
		}else result = -1;
		request.setAttribute("result", result);
		return "wishInsert";
	}

}
