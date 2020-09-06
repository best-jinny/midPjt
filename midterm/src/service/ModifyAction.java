package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;

public class ModifyAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		String member_id = request.getParameter("member_id");
		String member_password = request.getParameter("member_password");
		String member_name = request.getParameter("member_name");
		String member_email = request.getParameter("member_email");
		String member_tel = request.getParameter("member_tel");

		Member member = new Member();
		member.setMember_id(member_id);
		System.out.println(member_id);
		member.setMember_password(member_password);
		System.out.println(member_password);
		member.setMember_name(member_name);
		System.out.println(member_name);
		member.setMember_email(member_email);
		System.out.println(member_email);
		member.setMember_tel(member_tel);
		System.out.println(member_tel);

		MemberDao md = MemberDao.getInstance();

		int idPassValue = md.update(member);
	
		request.setAttribute("idPassValue", idPassValue);
		

		return "mypage/modify";
	}

}
