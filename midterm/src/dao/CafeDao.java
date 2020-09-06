 package dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Cafe;
import model.CafeLink;

public class CafeDao {
	private static CafeDao instance = new CafeDao();
	private CafeDao() {}
	public static CafeDao getInstance() {
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
	public List<Cafe> search(String subject) {
		@SuppressWarnings("unchecked")
		List<Cafe> list = session.selectList("cafens.search",subject);
		return list;
	}
	public List<Cafe> identify(List<CafeLink> listCld) {
		List<Cafe> list = new ArrayList<Cafe>();
		for (CafeLink cl:listCld) {
			int cafe_id = cl.getCafe_id();
			Cafe cafe = (Cafe) session.selectOne("cafens.select",cafe_id);
			list.add(cafe);
		}
		return list;
	}
	public List<Cafe> newest(List<Integer> cafe_idList) {
		@SuppressWarnings("unchecked")
		List<Cafe> list = session.selectList("cafens.newest",cafe_idList);
		return list;
	}
	public List<Cafe> hottest(List<Integer> cafe_idList) {
		@SuppressWarnings("unchecked")
		List<Cafe> list = session.selectList("cafens.hottest",cafe_idList);
		return list;
	}
	@SuppressWarnings("unchecked")
	public List<Cafe> list() {
		return session.selectList("cafens.list");
	} 
	public Cafe select(int cafe_id) {
		Cafe cafe = (Cafe) session.selectOne("cafens.select", cafe_id);
		return cafe;
	}
	public void updateReadCnt(int cafe_num) { // 상세페이지 이동시 조회수 증가
		session.update("cafens.updateReadCnt", cafe_num);
	}
	public List<Cafe> selectTop5() {	// 랭킹 페이지에서 조회수 상위 5개 카페 불러옴
		@SuppressWarnings("unchecked")
		List<Cafe> top5List = session.selectList("cafens.selectTop5");
		return top5List;
	}
	public int insert(Cafe cafe) {
		return session.insert("cafens.insert", cafe);
	
	}
	public int update(Cafe cafe) {
		// TODO Auto-generated method stub
		return session.update("cafens.update",cafe);
	}
	public int delete(int cafe_id) {
		// TODO Auto-generated method stub
		return session.delete("cafens.delete",cafe_id);
	}
	public int recent() {
		// TODO Auto-generated method stub
		return (int) session.selectOne("cafens.recent");
	}
	public Integer insertFind(String cafe_name) {
		return (int) session.selectOne("cafens.insertFind",cafe_name);
	}
}
