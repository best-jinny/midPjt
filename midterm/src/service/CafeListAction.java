package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;
import dao.CafeDao;
import dao.ImageDao;
import model.Cafe;

public class CafeListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		CafeDao cd = CafeDao.getInstance();
		List<Cafe> list = cd.list();
		ImageDao id = ImageDao.getInstance();
		Map<Integer,Integer> imgCount = new HashMap<Integer,Integer>();
		for (Cafe cafe : list) {
			int count = id.imgcount(cafe.getCafe_id());
			imgCount.put(cafe.getCafe_id(),count);
		}
		request.setAttribute("list",list);
		request.setAttribute("imgCount",imgCount);
		return"admin/cafeList";
	}

}
