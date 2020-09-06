package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeLinkDao;
import dao.HashLinkDao;
import dao.HashtagDao;
import model.Hashtag;

public class HashDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		int hash_id = Integer.parseInt(request.getParameter("hash_id"));
		
		//hash_link 연결 내역 삭제
		HashLinkDao hld = HashLinkDao.getInstance();
		int resultHld = hld.deleteAll(hash_id);
		
		//cafe_link 연결내역 삭제
		CafeLinkDao cld = CafeLinkDao.getInstance();
		int resultCld = cld.deleteAll(hash_id);
		
		//hashtag 삭제
		HashtagDao hd = HashtagDao.getInstance(); 
		int resultHd = hd.delete(hash_id);

		try { 
			Thread.sleep(200); 
		} catch (InterruptedException e) { 
			// TODO Auto-generated catch block 
			e.printStackTrace(); 
		}

		//새로운 목록 형성
		List<Hashtag> hashList = hd.list();
		
		request.setAttribute("list",hashList);
		request.setAttribute("resultHd", resultHd);
		request.setAttribute("resultHld", resultHld);
		request.setAttribute("resultCld", resultCld);
		return "admin/hashDelete";
	}

}
