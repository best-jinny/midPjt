package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HashtagDao;
import model.Hashtag;

public class SearchHash implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		// subject: 검색한 단어
		String subject = request.getParameter("subject");
		
		// 1. 	Searching through hashtag names to see if there are
		// 		any matches with search "subject"
		HashtagDao hd = HashtagDao.getInstance();
		List<Hashtag> listHdSearch = hd.search(subject);
		String newHashtag = subject;
		Boolean needNew = true;
		for (Hashtag h:listHdSearch) {
			if (h.getHash_name().equals(newHashtag)) needNew = false;
		}

		try { 
			Thread.sleep(500); 
		} catch (InterruptedException e) { 
			// TODO Auto-generated catch block 
			e.printStackTrace(); 
		}

		request.setAttribute("listHdSearch", listHdSearch);
		request.setAttribute("newHashtag", newHashtag);
		request.setAttribute("needNew", needNew);
		return "search/searchHash";
	}

}
