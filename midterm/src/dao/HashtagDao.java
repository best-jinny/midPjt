package dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.HashLink;
import model.Hashtag;

public class HashtagDao {
	private static HashtagDao instance = new HashtagDao();
	private HashtagDao() {}
	public static HashtagDao getInstance() {
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
	public List<Hashtag> search(String subject) {
		@SuppressWarnings("unchecked")
		List<Hashtag> list = (List<Hashtag>)session.selectList("hashtagns.search",subject);
		return list;
	}
	public Hashtag select(int hash_id) {
		Hashtag hashtag = (Hashtag)session
				.selectOne("hashtagns.select", hash_id);
		return hashtag;
	}
	public List<Hashtag> identify(List<HashLink> listHl) {
		List<Hashtag> list = new ArrayList<Hashtag>();
		for (HashLink hl:listHl) {
			int hash_id = hl.getHash_id();
			Hashtag hash = (Hashtag) session.selectOne("hashtagns.select",hash_id);
			list.add(hash);
		}
		return list;
	}
	public String selectName(int hash_id) {
		String hash_name = (String) session.selectOne("hashtagns.selectName",hash_id);
		return hash_name;
	}
	public int insert(String hash_name) {
		int result = (int) session.insert("hashtagns.insert", hash_name);
		return result;
	}
	public int insertFind(String hash_name) {
		int hash_id = (int) session.selectOne("hashtagns.insertFind",hash_name);
		return hash_id;
	}
	@SuppressWarnings("unchecked")
	public List<Hashtag> list() {
		return session.selectList("hashtagns.list");
	}
	public int delete(int hash_id) {
		return session.delete("hashtagns.delete", hash_id);
	}
	public Hashtag selectName(String subject) {
		return (Hashtag) session.selectOne("hashtagns.selectName", subject);
	}
	public Hashtag selectNameCheck(String subject) {
		return (Hashtag) session.selectOne("hashtagns.selectNameCheck",subject);
	}
	public int recent() {
		return (int) session.selectOne("hashtagns.recent");
	}
	//review
	public List<Hashtag> selectHash(int cafe_id) { // 상세페이지에서 해당 카페 해시태그 불러옴
		@SuppressWarnings("unchecked")
		List<Hashtag> hashList = session.selectList("hashtagns.selectHash", cafe_id);
		return hashList;
	}
	public Hashtag selectId(String hash_name) {
		Hashtag hashtag = (Hashtag) session.selectOne("hashtagns.selectId", hash_name);
		return hashtag;
	}
}
