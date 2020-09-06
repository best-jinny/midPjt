package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;

public class Id_Confirm implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String member_id = request.getParameter("member_id");
		MemberDao md = MemberDao.getInstance();
		Member member  = md.select(member_id);
		String idPassValue = "";
		if (member == null) {
			idPassValue = "사용 가능한 ID입니다";
		} else {
			idPassValue = "이미 사용중인 아이디 입니다. 다른 ID를 사용하세요";
		} 
		request.setAttribute("idPassValue", idPassValue);
		return "mypage/id_Confirm";
	}

}
