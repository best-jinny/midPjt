package service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HashKindDao;
import model.HashKind;

public class NoSearch implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String subject = request.getParameter("subject");
		HashKindDao hkd = HashKindDao.getInstance();
		List<HashKind> hashKindList = hkd.selectList();
		Collections.shuffle(hashKindList);
		List<HashKind> hashSend = new ArrayList<HashKind>();
		for (int i=0;i<4;i++) {
			hashSend.add(hashKindList.get(i));
		}
		request.setAttribute("hashKindList", hashSend);
		request.setAttribute("subject", subject);
		return "search/noSearch";
	}

}
