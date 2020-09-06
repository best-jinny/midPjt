package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;
import dao.CafeDao;

public class CafeDeleteAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
		CafeDao cd = CafeDao.getInstance();
		int result = cd.delete(cafe_id);
		request.setAttribute("result",result);
		return "admin/cafeDelete";
	}

}
