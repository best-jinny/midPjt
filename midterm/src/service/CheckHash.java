package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HashtagDao;
import model.Hashtag;

public class CheckHash implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		// subject: 검색한 단어
		String subject = request.getParameter("subject");
		
		HashtagDao hd = HashtagDao.getInstance();

		int result = 0;
		
		Hashtag hash = hd.selectNameCheck(subject);
		
		if (hash!=null) {
			result = 1;
		}
		
		try { 
			Thread.sleep(500); 
		} catch (InterruptedException e) { 
			// TODO Auto-generated catch block 
			e.printStackTrace(); 
		}
		
		request.setAttribute("result", result);
		return "search/checkHash";
	}

}
