package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeDao;
import model.Cafe;

public class SearchCafe implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		// subject: 검색한 단어
		String subject = request.getParameter("subject");
		
		// 1. 	Searching through cafe names to see if there are
		// 		any matches with search "subject"
		CafeDao cd = CafeDao.getInstance();
		List<Cafe> listCafeSearch = cd.search(subject);
		for (Cafe cafe:listCafeSearch) {
			System.out.println(cafe.getCafe_name());
		}
		
		try { 
			Thread.sleep(500); 
		} catch (InterruptedException e) { 
			// TODO Auto-generated catch block 
			e.printStackTrace(); 
		}

		request.setAttribute("listCafeSearch", listCafeSearch);
		return "search/searchCafe";
	}

}
