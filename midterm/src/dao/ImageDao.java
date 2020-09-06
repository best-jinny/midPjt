package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Image;

public class ImageDao {
	private static ImageDao instance = new ImageDao();
	private ImageDao() {}
	public static ImageDao getInstance() {
		return instance;
	}
	//DB 연결: connection pool대신에 SqlSession 생성
	private static SqlSession session;
	static { //클래스변수 초기화 블럭
		try {
			Reader reader = 
					Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = 
					new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println("초기화 에러: "+e.getMessage());
		}
	}
	public String selectMain(int cafe_id) {
		String img_path = (String) session.selectOne("imagens.selectMain",cafe_id);
		return img_path;
	}
	public List<Image> select(int cafe_id) {	// 해당 카페에 대한 이미지 리스트 불러옴
		@SuppressWarnings("unchecked")
		List<Image> list = session.selectList("imagens.select", cafe_id );
		return list;
	}
	public int insert(Image image) {
		return session.insert("imagens.insert", image);
	
	}
	public int update(Image image) {
		return session.update("imagens.update",image);
	}
	public int delete(int img_id) { 
		return session.delete("imagens.delete",img_id); 
	}
	public int imgcount(int cafe_id) {
		return (int) session.selectOne("imagens.imgcount",cafe_id);
	}
	public Image selectMainCafe(int cafe_id) {
		return (Image) session.selectOne("imagens.selectMainCafe",cafe_id);
	}
}
