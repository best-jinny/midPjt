package dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.HashKind;
import model.HashLink;

public class HashLinkDao {
	private static HashLinkDao instance = new HashLinkDao();
	private HashLinkDao() {}
	public static HashLinkDao getInstance() {
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
	public List<HashLink> identify(List<HashKind> listHkd) {
		List<HashLink> list = new ArrayList<HashLink>();
		for (HashKind hk:listHkd) {
			int hashkind_id = hk.getHashkind_id();
			@SuppressWarnings("unchecked")
			List<HashLink> innerList 
				= session.selectList("hashlinkns.select",hashkind_id);
			for (HashLink hl:innerList) {
				list.add(hl);
			}
		}
		return list;
	}
	public int deleteAll(int hash_id) {
		return session.delete("hashlinkns.deleteAll", hash_id);
	}
	public int deleteAllKind(int hashkind_id) {
		return session.delete("hashlinkns.deleteAllKind", hashkind_id);
	}
	public int insert(HashLink hl) {
		// TODO Auto-generated method stub
		return session.insert("hashlinkns.insert", hl);
	}
	@SuppressWarnings("unchecked")
	public List<HashLink> select(int hashkind_id) {
		return session.selectList("hashlinkns.select",hashkind_id);
	}
	@SuppressWarnings("unchecked")
	public List<HashLink> selectHash(int hash_id) {
		return session.selectList("hashlinkns.selectHash",hash_id);
	}
}
