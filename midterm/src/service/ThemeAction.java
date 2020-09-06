package service;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HashKindDao;
import model.HashKind;

public class ThemeAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HashKindDao hkd = HashKindDao.getInstance();
		List<HashKind> hashKindList = hkd.selectList();
		Collections.shuffle(hashKindList);
		request.setAttribute("hashKindList", hashKindList);
		
		return "searchDetail/theme";
	}

}
