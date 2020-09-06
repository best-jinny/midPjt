package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HashKindDao;
import model.HashKind;

public class SearchHashKind implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		// subject: 검색한 단어
		String subject = request.getParameter("subject");
		
		// 1. 	Searching through hashkind names to see if there are
		// 		any matches with search "subject"
		HashKindDao hkd = HashKindDao.getInstance();
		List<HashKind> listHkdSearch = hkd.search(subject);
		String newHashKind = subject;
		Boolean needNew = true;
		for (HashKind h:listHkdSearch) {
			if (h.getHashkind_name().equals(newHashKind)) needNew = false;
		}

		try { 
			Thread.sleep(500); 
		} catch (InterruptedException e) { 
			// TODO Auto-generated catch block 
			e.printStackTrace(); 
		}

		request.setAttribute("listHkdSearch", listHkdSearch);
		request.setAttribute("newHashKind", newHashKind);
		request.setAttribute("needNew", needNew);
		return "search/searchHashKind";
	}

}
