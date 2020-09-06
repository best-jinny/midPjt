package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.WishList;

public class WishListDao {
	private static WishListDao instance = new WishListDao();
	private WishListDao() {}
	public static WishListDao getinstance() {
		return instance;
	}
	private static SqlSession session;
	static {
		try {
			Reader reader =
					Resources.getResourceAsReader("configuration.xml");
		SqlSessionFactory ssf =
				new SqlSessionFactoryBuilder().build(reader);
				session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	public List<WishList> list(String member_id) {
		@SuppressWarnings("unchecked")
		List<WishList> list = session.selectList("wishlistns.list", member_id);
		return list;
	}
	public List<WishList> select(WishList check) {
		@SuppressWarnings("unchecked")
		List<WishList> wishlist = session.selectList("wishlistns.wishcheck",check);
		return wishlist;
	}
	public int insert(WishList check) {
		int result = session.insert("wishlistns.insert", check);
		return result;
	}
	public int delete(WishList wish) {
		int result = session.delete("wishlistns.delete", wish);
		return result;
	}
	//위시리스트 등록 전 카페 중복체크 위한 메서드 
	public WishList insertChk(String memberId, int cafeId) {
		String cafe_id = Integer.toString(cafeId);
		// select 쿼리에 매개변수 두 개 전달하려면 HashMap 사용. 
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", memberId);
		map.put("cafe_id", cafe_id);
		return (WishList)session.selectOne("wishlistns.insertChk",map);
	}
		
	//위시리스트에 카페 등록
	public int insertCafe(WishList wishlist) {
		return session.insert("wishlistns.insertCafe", wishlist);
	}
}
