package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeDao;
import dao.CafeLinkDao;
import dao.HashKindDao;
import dao.HashLinkDao;
import dao.HashtagDao;
import model.Cafe;
import model.CafeLink;
import model.HashLink;
import model.Hashtag;

public class HashtagList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HashtagDao hd = HashtagDao.getInstance();
		List<Hashtag> hashList = hd.list();
		
		Map<Integer, String> hashKindMap = new HashMap<Integer, String>();
		Map<Integer, String> cafeMap = new HashMap<Integer, String>();
		HashKindDao hkd = HashKindDao.getInstance();
		CafeDao cd = CafeDao.getInstance();
		HashLinkDao hld = HashLinkDao.getInstance();
		CafeLinkDao cld = CafeLinkDao.getInstance();
		
		for (Hashtag hash:hashList) {
			
			// 관련 해시카인드 찾기
			List<HashLink> hashLinkList = hld.selectHash(hash.getHash_id());
			String hashKindList = "";
			for (HashLink hashLink:hashLinkList) {
				hashKindList += "#" + hkd.select(hashLink.getHashkind_id()) + " ";
			}
			hashKindMap.put(hash.getHash_id(), hashKindList);
			
			// 관련 카페 찾기
			List<CafeLink> cafeLinkList = cld.selectHash(hash.getHash_id());
			String cafeList = "";
			for (CafeLink cafeLink:cafeLinkList) {
				Cafe cafe = cd.select(cafeLink.getCafe_id());
				cafeList += cafe.getCafe_name() + " ";
			}
			cafeMap.put(hash.getHash_id(), cafeList);
		}
		
		request.setAttribute("hashKindMap", hashKindMap);
		request.setAttribute("cafeMap", cafeMap);
		request.setAttribute("list",hashList);
		return "admin/hashtagList";
	}

}
