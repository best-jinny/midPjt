package service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeDao;
import dao.CafeLinkDao;
import dao.HashKindDao;
import dao.HashLinkDao;
import dao.HashtagDao;
import model.CafeLink;
import model.HashLink;

public class HashInsertAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		String hash_name = request.getParameter("hash_name");
		
		int result = 0;
		HashtagDao hd = HashtagDao.getInstance();
		result = hd.insert(hash_name);
		
		// 방금생성한 해시 아이디 찾아오기
		int hash_id = hd.recent();
		
		// 들어온 해시카인드 배열로 만들기
		String hashOriginal = request.getParameter("hashOriginalList");
		String hashNew = request.getParameter("hashNewList");
		HashKindDao hkd = HashKindDao.getInstance();
		HashLinkDao hld = HashLinkDao.getInstance();
		HashLink hl = new HashLink();
		
		if (hashOriginal!=null && hashOriginal.length()!=0) {
			String[] hashOriginalSplit = hashOriginal.split(" ");
			
			// 중복제거
			Set<String> hashOriginalSet = new HashSet<String>();
			for(int i=0;i<hashOriginalSplit.length;i++) {
				hashOriginalSet.add(hashOriginalSplit[i]);
			}
			
			Iterator<String> itOld = hashOriginalSet.iterator();
			List<Integer> hashOriginalList = new ArrayList<Integer>();
			while (itOld.hasNext()) {
				String itOldString = itOld.next();
				hashOriginalList.add(hkd.insertFind(itOldString));
			}
			
			for (int i=0;i<hashOriginalList.size();i++) {
				if (hashOriginalList.get(i)!=null) {
					hl.setHashkind_id(hashOriginalList.get(i));
					hl.setHash_id(hash_id);
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
					hkd.insert(hashNewString);
					hashNewList.add(hkd.insertFind(hashNewString));
				}
			}
			
			// 해시태그와 카인드 연결
			HashLink hln = new HashLink();
			for (int i=0;i<hashNewList.size();i++) {
				if (hashNewList.get(i)!=null) {
					hln.setHashkind_id(hashNewList.get(i));
					hln.setHash_id(hash_id);
					hld.insert(hln);
				}
			}
		}
		
		//카페 저장
		String cafeList = request.getParameter("cafeList");
		CafeDao cd = CafeDao.getInstance();
		CafeLinkDao cld = CafeLinkDao.getInstance();
		CafeLink cl = new CafeLink();
		
		if (cafeList!=null && cafeList.length()!=0) {
			String[] cafeSplit = cafeList.split(" ");
			
			// 중복제거
			Set<String> cafeSet = new HashSet<String>();
			for(int i=0;i<cafeSplit.length;i++) {
				cafeSet.add(cafeSplit[i]);
			}
			
			Iterator<String> itCafe = cafeSet.iterator();
			List<Integer> cafeIdList = new ArrayList<Integer>();
			while (itCafe.hasNext()) {
				String cafeName = itCafe.next();
				cafeIdList.add(cd.insertFind(cafeName));
			}
			
			for (int i=0;i<cafeIdList.size();i++) {
				if (cafeIdList.get(i)!=null) {
					cl.setCafe_id(cafeIdList.get(i));
					cl.setHash_id(hash_id);
					cld.insert(cl);
				}
			}
		}
		
		request.setAttribute("result", result);
		return "admin/hashInsert";
	}

}
