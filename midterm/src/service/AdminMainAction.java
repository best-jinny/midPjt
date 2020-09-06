package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.CommandProcess;
import dao.MemberDao;
import model.Member;

public class AdminMainAction implements CommandProcess{

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String memberid = (String) session.getAttribute("memberid");
		if(memberid != null) {
			MemberDao md = MemberDao.getInstance();
			Member member = md.select(memberid);
			request.setAttribute("member",member);
		}
		return "admin/adminMain";
	}

}
