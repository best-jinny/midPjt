package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Member;

public class MemberDao {
	private static MemberDao instance = new MemberDao();
	private MemberDao() {}
	public static MemberDao getInstance() {		
		return instance;
	} //DB연결 : connection pool대신에 sqalSession 생성
	private static SqlSession session;
	static { //클래스 변수 초기화 블럭
		try {Reader reader =
				Resources.getResourceAsReader("configuration.xml");
				SqlSessionFactory ssf=
						new SqlSessionFactoryBuilder().build(reader);
				session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	public int insert(Member member) {
		int result = session.insert("memberns.insert",member);
		System.out.println("member"+member);
		return result;
	}
	public Member select(String member_id) {
		Member member = (Member)session.selectOne("memberns.select",member_id);
		return member;
	}
	public int loginCheck(String member_id, String member_password) {
		int idPassValue = 0;
		Member member = select(member_id);
		if (member == null) idPassValue= -1;
		else if(member.getMember_password().equals(member_password)) {
			idPassValue= 1;
		}return idPassValue;
	}
	public int update(Member member) {
		return session.update("memberns.update",member);
	}
	public int delete(String member_id) {
		return session.update("memberns.delete",member_id);
	}
	@SuppressWarnings("unchecked")
	public List<Member> list(int startRow,int endRow){
		HashMap<String,Integer> hm = new HashMap<String,Integer>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return session.selectList("memberns.list",hm);
	}
}
