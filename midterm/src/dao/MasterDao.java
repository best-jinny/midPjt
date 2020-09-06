package dao;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Master;

public class MasterDao {
	private static MasterDao instance = new MasterDao();
	private MasterDao() {}
	public static MasterDao getInstance() {
		return instance;
	}
	// DB연결 : Connection Pool대신에 SqlSession생성
	private  static SqlSession session;
	static { // 클래스변수 초기화 블럭
		try {
			Reader reader = 
				Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf =
				new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		}catch (Exception e) {
			System.out.println("초기화 에러 : "+e.getMessage());
		}
	}	
	public int loginCheck(String master_id, String master_password) {
		int idPassValue = 0;
		Master master = select(master_id);
		if (master == null) {
			idPassValue = -1;
		} else if (master.getMaster_pw().equals(master_password)) {
			idPassValue = 1;
		}
		return idPassValue;
	} 
	public Master select(String master_id) {
		Master master = (Master) session.selectOne("masterns.select", master_id);
		return master;
	}
}




