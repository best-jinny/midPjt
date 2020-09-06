package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;

public class MemberDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		MemberDao md =MemberDao.getInstance();
		int idPassValue = md.delete(member_id);
		if(idPassValue > 0) {
			session.invalidate();
		}
		request.setAttribute("idPassValue", idPassValue);
		return "mypage/delete";
	}

}
