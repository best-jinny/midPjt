package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;

public class ModifyForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session =request.getSession();
		String member_id =(String)session.getAttribute("member_id");
		MemberDao md =MemberDao.getInstance();
		Member member = md.select(member_id);
		request.setAttribute("member", member);
		return "mypage/modifyForm";
	}

}
