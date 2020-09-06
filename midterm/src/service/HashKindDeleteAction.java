package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HashKindDao;
import dao.HashLinkDao;
import model.HashKind;

public class HashKindDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		int hashkind_id = Integer.parseInt(request.getParameter("hashkind_id"));
		
		//hash_link 연결 내역 삭제
		HashLinkDao hld = HashLinkDao.getInstance();
		int resultHld = hld.deleteAllKind(hashkind_id);
		
		//hashkind 삭제
		HashKindDao hkd = HashKindDao.getInstance(); 
		int resultHkd = hkd.delete(hashkind_id);
		System.out.println(resultHld);
		System.out.println(resultHkd);
		
		try { 
			Thread.sleep(200); 
		} catch (InterruptedException e) { 
			// TODO Auto-generated catch block 
			e.printStackTrace(); 
		}
		
		//새로운 목록 형성
		List<HashKind> hashList = hkd.selectList();
		
		request.setAttribute("list",hashList);
		request.setAttribute("resultHd", resultHkd);
		request.setAttribute("resultHld", resultHld);
		return "admin/hashKindDelete";
	}

}
