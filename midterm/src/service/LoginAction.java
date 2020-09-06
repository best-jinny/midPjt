package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MasterDao;
import dao.MemberDao;

public class LoginAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String member_id = request.getParameter("member_id");
		String member_password=request.getParameter("member_password");
		
		// 회원 로그인 체크
		MemberDao md = MemberDao.getInstance();
		int idPassValue = md.loginCheck(member_id, member_password);
		if(idPassValue > 0 ) {
			HttpSession session = request.getSession();
			session.setAttribute("member_id", member_id);
		}
		request.setAttribute("idPassValue", idPassValue);
		// 마스터 로그인 체크
		MasterDao md2 = MasterDao.getInstance();
		int idPassValue2 = md2.loginCheck(member_id, member_password);
		if(idPassValue2 > 0 ) {
			idPassValue = 2;
		}
		request.setAttribute("idPassValue", idPassValue);
		return "login/login";
	}

}
