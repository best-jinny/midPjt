package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HashKindDao;
import model.HashKind;

public class CheckHashKind implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		// subject: 검색한 단어
		String subject = request.getParameter("subject");
		
		HashKindDao hkd = HashKindDao.getInstance();

		int result = 0;
		
		HashKind hk = hkd.selectName(subject);
		
		if (hk!=null) {
			System.out.println("해시카인드존재:"+hk.getHashkind_name());
			result = 1;
		}
		
		try { 
			Thread.sleep(500); 
		} catch (InterruptedException e) { 
			// TODO Auto-generated catch block 
			e.printStackTrace(); 
		}
		
		request.setAttribute("result", result);
		return "search/checkHashKind";
	}

}
