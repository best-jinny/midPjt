package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HashKindDao;
import dao.HashLinkDao;
import dao.HashtagDao;
import model.HashKind;
import model.HashLink;

public class HashKindList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HashKindDao hkd = HashKindDao.getInstance();
		HashtagDao hd = HashtagDao.getInstance();
		List<HashKind> hashList = hkd.selectList();
		Map<Integer, String> hashtagMap = new HashMap<Integer, String>();
		HashLinkDao hld = HashLinkDao.getInstance();
		for (HashKind hk:hashList) {
			List<HashLink> hashLinkList = hld.select(hk.getHashkind_id());
			String hashtagList = "";
			for (HashLink hashLink:hashLinkList) {
				hashtagList += "#" + hd.selectName(hashLink.getHash_id())+" ";
			}
			hashtagMap.put(hk.getHashkind_id(), hashtagList);
		}
		request.setAttribute("list",hashList);
		request.setAttribute("hashtagMap",hashtagMap);
		return "admin/hashKindList";
	}

}
