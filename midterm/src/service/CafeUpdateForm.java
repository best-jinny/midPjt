package service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;
import dao.CafeDao;
import dao.CafeLinkDao;
import dao.HashtagDao;
import dao.ImageDao;
import model.Cafe;
import model.CafeLink;
import model.Hashtag;
import model.Image;

public class CafeUpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
		CafeDao cd = CafeDao.getInstance();
		Cafe cafe = cd.select(cafe_id);
		ImageDao id = ImageDao.getInstance();
		List<Image> imageList = id.select(cafe_id);
		
		//연결된 해시태그 불러오기
		CafeLinkDao cld = CafeLinkDao.getInstance();
		List<CafeLink> hashConnId = cld.selectList(cafe_id);
		HashtagDao hd = HashtagDao.getInstance();
		List<Hashtag> hashConnected = new ArrayList<Hashtag>();
		for (CafeLink cl:hashConnId) {
			hashConnected.add(hd.select(cl.getHash_id()));
		}
		
		request.setAttribute("hashConnected", hashConnected);
		request.setAttribute("cafe",cafe);
		request.setAttribute("imageList",imageList);
		return "admin/cafeUpdateForm";
	}

}
