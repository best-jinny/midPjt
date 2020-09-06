package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ImageDao;
import model.Image;

public class ImageDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int img_id = Integer.parseInt(request.getParameter("img_id"));
		int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
		System.out.println(img_id);
		ImageDao id = ImageDao.getInstance();
		id.delete(img_id);
		List<Image> imageList = id.select(cafe_id);
		request.setAttribute("imageList",imageList);
		return "admin/imageDelete";
	}

}
