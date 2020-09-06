package service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
public class JoinAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String member_id = request.getParameter("member_id");
		String member_password = request.getParameter("member_password");
		String member_name = request.getParameter("member_name");
		String member_email = request.getParameter("member_email");
		String member_tel = request.getParameter("member_tel");
		Member member = new Member();
		member.setMember_id(member_id);;
		member.setMember_name(member_name);
		member.setMember_password(member_password);
		member.setMember_email(member_email);
		member.setMember_tel(member_tel);
		
		MemberDao md = MemberDao.getInstance();
		int idPassValue = md.insert(member);
		request.setAttribute("idPassValue", idPassValue);
		return "mypage/join";
	}

}
