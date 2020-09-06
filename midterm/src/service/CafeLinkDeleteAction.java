package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeLinkDao;
import model.CafeLink;

public class CafeLinkDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		CafeLink cl = new CafeLink();
		System.out.println(request.getParameter("hash_id"));
		System.out.println(request.getParameter("cafe_id"));
		cl.setCafe_id(Integer.parseInt(request.getParameter("cafe_id")));
		cl.setHash_id(Integer.parseInt(request.getParameter("hash_id")));
		CafeLinkDao cld = CafeLinkDao.getInstance();
		
		int result = cld.delete(cl);
		System.out.println(result);
		request.setAttribute("result", result);
		return "admin/cafeLinkDelete";
	}

}
