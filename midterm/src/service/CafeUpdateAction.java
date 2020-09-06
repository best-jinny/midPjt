package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import service.CommandProcess;
import dao.CafeDao;
import dao.CafeLinkDao;
import dao.HashtagDao;
import dao.ImageDao;
import model.Cafe;
import model.CafeLink;
import model.Image;


public class CafeUpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		//저장가능한 파일크키
		int maxSize = 10 * 1024 * 1024; 
		
		//파일이 저장된 경로
		String real = request.getSession()
				.getServletContext().getRealPath("/upload");
		MultipartRequest mr=null;
		//실제 파일 업로드 과정
		try {
			mr = new MultipartRequest(request,
					real,maxSize,"utf-8",new DefaultFileRenamePolicy());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//카페 등록 정보 저장
		int cafe_id = Integer.parseInt(mr.getParameter("cafe_id"));
		String cafe_map = mr.getParameter("cafe_map");
		if (cafe_map.startsWith("(")) {
			cafe_map = cafe_map.substring(1, cafe_map.length());
		}
		if (cafe_map.endsWith(")")) {
			cafe_map = cafe_map.substring(0, cafe_map.length()-1);
		}
		Cafe cafe = new Cafe();
		cafe.setCafe_name(mr.getParameter("cafe_name"));
		cafe.setCafe_id(cafe_id);
		cafe.setCafe_tel(mr.getParameter("cafe_tel"));
		cafe.setCafe_addr(mr.getParameter("cafe_addr"));
		cafe.setCafe_map(cafe_map);
		cafe.setCafe_hours(mr.getParameter("cafe_hours"));
		cafe.setCafe_parking(mr.getParameter("cafe_parking"));
		cafe.setCafe_desc(mr.getParameter("cafe_desc"));
		
		// DB에 저장 
		CafeDao cd = CafeDao.getInstance();
		int result = cd.update(cafe);
		
		// 이미지 DTO에 이미지 경로 저장
		ImageDao id = ImageDao.getInstance();
		int fileNum = Integer.parseInt(mr.getParameter("fileNum"));
		int resultImg = 0;
		for (int i=0;i<fileNum;i++) {
			String file = mr.getFilesystemName("file"+(i+1));
			Image image = new Image();
			if (file != null && !file.equals("")) {
				image.setImg_path(file);
				image.setCafe_id(cafe_id);
				resultImg = id.insert(image);
			}
		}
		// 들어온 해시태그 배열로 만들기
		String hashOriginal = mr.getParameter("hashOriginalList");
		String hashNew = mr.getParameter("hashNewList");
		HashtagDao hd = HashtagDao.getInstance();
		CafeLinkDao cld = CafeLinkDao.getInstance();
		CafeLink cl = new CafeLink();
				
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
				hashOriginalList.add(hd.insertFind(itOldString));
			}
			
			for (int i=0;i<hashOriginalList.size();i++) {
				if (hashOriginalList.get(i)!=null) {
					cl.setCafe_id(cafe_id);
					cl.setHash_id(hashOriginalList.get(i));
					cld.insert(cl);
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
				if (hashNewString!=" " && hashNewString!="" && hashNewString!=null) {
					hd.insert(hashNewString);
					hashNewList.add(hd.insertFind(hashNewString));
				}
			}
			
			// 해시태그와 카페 연결
			CafeLink cln = new CafeLink();
			for (int i=0;i<hashNewList.size();i++) {
				if (hashNewList.get(i)!=null) {
					cln.setCafe_id(cafe_id);
					cln.setHash_id(hashNewList.get(i));
					cld.insert(cln);
				}
			}
		}	
		
		request.setAttribute("result",result);
		request.setAttribute("resultImg",resultImg);
		return "admin/cafeUpdate";
	}

}
