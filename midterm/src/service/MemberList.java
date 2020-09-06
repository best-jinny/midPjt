package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;
import dao.MemberDao;

public class MemberList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		/*
		 * HttpSession session = request.getSession(); String id =
		 * (String)session.getAttribute("id");
		 */
		MemberDao md = MemberDao.getInstance();
		List<model.Member> list = md.list(1,10);
		request.setAttribute("list",list);
		System.out.println("size = "+list.size());
		return "admin/memberList";
	}

}
