package service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HashKindDao;
import dao.HashLinkDao;
import dao.HashtagDao;
import model.HashLink;

public class HashKindInsertAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		String hashkind_name = request.getParameter("hashkind_name");
		
		int result = 0;
		HashKindDao hkd = HashKindDao.getInstance();
		result = hkd.insert(hashkind_name);
		
		// 방금생성한 해시카인드 아이디 찾아오기
		int hashkind_id = hkd.recent();
		
		// 들어온 해시태그 배열로 만들기
		String hashOriginal = request.getParameter("hashOriginalList");
		String hashNew = request.getParameter("hashNewList");
		HashtagDao hd = HashtagDao.getInstance();
		HashLinkDao hld = HashLinkDao.getInstance();
		HashLink hl = new HashLink();
		
		if (hashOriginal!=null && hashOriginal.length()!=0) {
			String[] hashOriginalSplit = hashOriginal.split(" ");
			
			// 중복제거
			Set<String> hashOriginalSet = new HashSet<String>();
			for(int i=0;i<hashOriginalSplit.length;i++) {
				hashOriginalSet.add(hashOriginalSplit[i]);
				System.out.println(hashOriginalSplit[i]);
			}
			
			Iterator<String> itOld = hashOriginalSet.iterator();
			List<Integer> hashOriginalList = new ArrayList<Integer>();
			while (itOld.hasNext()) {
				String itOldString = itOld.next();
				hashOriginalList.add(hd.insertFind(itOldString));
			}
			
			for (int i=0;i<hashOriginalList.size();i++) {
				if (hashOriginalList.get(i)!=null) {
					hl.setHashkind_id(hashkind_id);
					hl.setHash_id(hashOriginalList.get(i));
					hld.insert(hl);
				}
			}
		}
		
		if (hashNew!=null && hashNew.length()!=0) {
			String[] hashNewSplit = hashNew.split(" ");
			
			// 중복제거
			Set<String> hashNewSet = new HashSet<String>();
			for(int i=0;i<hashNewSplit.length;i++) {
				hashNewSet.add(hashNewSplit[i]);
			}
			
			// 새로운 해시태그 저장
			Iterator<String> it = hashNewSet.iterator();
			List<Integer> hashNewList = new ArrayList<Integer>();
			while (it.hasNext()) {
				String hashNewString = it.next();
				if (hashNewString!=" " && hashNewString!="") {
					System.out.println(hashNewString);
					hd.insert(hashNewString);
					hashNewList.add(hd.insertFind(hashNewString));
				}
			}
			
			// 해시태그와 카인드 연결
			HashLink hln = new HashLink();
			for (int i=0;i<hashNewList.size();i++) {
				if (hashNewList.get(i)!=null) {
					hln.setHashkind_id(hashkind_id);
					hln.setHash_id(hashNewList.get(i));
					hld.insert(hln);
				}
			}
		}
		
		request.setAttribute("result", result);
		return "admin/hashKindInsert";
	}

}
