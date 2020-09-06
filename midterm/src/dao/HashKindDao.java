package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.HashKind;

public class HashKindDao {
	private static HashKindDao instance = new HashKindDao();
	private HashKindDao() {}
	public static HashKindDao getInstance() {
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
	public List<HashKind> search(String subject) {
		@SuppressWarnings("unchecked")
		List<HashKind> list = (List<HashKind>)session.selectList("hashkindns.search",subject);
		return list;
	}
	public List<HashKind> selectList() {	//테마페이지에서 해시그룹정보 받아옴
		@SuppressWarnings("unchecked")
		List<HashKind> hashKindList = session.selectList("hashkindns.selectList");
		return hashKindList;
	}
	public int delete(int hashkind_id) {
		return session.delete("hashkindns.delete", hashkind_id);
	}
	public HashKind selectName(String subject) {
		return (HashKind) session.selectOne("hashkindns.selectName", subject);
	}
	public int insert(String hashkind_name) {
		// TODO Auto-generated method stub
		return session.insert("hashkindns.insert", hashkind_name);
	}
	public int recent() {
		// TODO Auto-generated method stub
		return (int) session.selectOne("hashkindns.recent");
	}
	public String select(int hashkind_id) {
		// TODO Auto-generated method stub
		return (String) session.selectOne("hashkindns.selectNameOnly", hashkind_id);
	}
	public Integer insertFind(String hashkind_name) {
		return (int) session.selectOne("hashkindns.insertFind",hashkind_name);
	}
}
