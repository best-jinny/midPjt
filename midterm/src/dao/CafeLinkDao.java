package dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.CafeLink;
import model.Hashtag;

public class CafeLinkDao {
	private static CafeLinkDao instance = new CafeLinkDao();
	private CafeLinkDao() {}
	public static CafeLinkDao getInstance() {
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
	public List<CafeLink> identify(List<Hashtag> listHdSearch, String member_id) {
		List<CafeLink> list = new ArrayList<CafeLink>();
		if (listHdSearch!=null) {
			for (Hashtag h:listHdSearch) {
				int hash_id = h.getHash_id();
				@SuppressWarnings("unchecked")
				List<CafeLink> insideList = 
					session.selectList("cafelinkns.selectIdentify",hash_id);
				for (CafeLink cl:insideList) {
					list.add(cl);
				}
				if (member_id!=null) {
					CafeLink clUse = new CafeLink();
					clUse.setHash_id(hash_id);
					clUse.setMember_id(member_id);
					@SuppressWarnings("unchecked")
					List<CafeLink> insideMemberList = 
						session.selectList("cafelinkns.selectIdentifyMember",clUse);
					for (CafeLink cl:insideMemberList) {
						list.add(cl);
					}
				} 
			}	
		}
		return list;
	}
	public List<CafeLink> selectList(int cafe_id) {
		@SuppressWarnings("unchecked")
		List<CafeLink> list = session.selectList("cafelinkns.selectCafe",cafe_id);
		return list;
	}
	public int insert(CafeLink cl) {
		return session.insert("cafelinkns.insert", cl);
	}
	public int delete(CafeLink cl) {
		return session.delete("cafelinkns.delete", cl);
	}
	public int deleteAll(int hash_id) {
		return session.delete("cafelinkns.deleteAll",hash_id);
	}
	@SuppressWarnings("unchecked")
	public List<CafeLink> selectHash(int hash_id) {
		// TODO Auto-generated method stub
		return session.selectList("cafelinkns.selectHash", hash_id);
	}
	// 리뷰
	@SuppressWarnings("unchecked")
	public List<Integer> selectHashCafe(int cafe_id){
		List<Integer> list = session.selectList("cafelinkns.selectHashCafe", cafe_id);
		return list;
	}
	public void insertByMember(CafeLink cafelink) {
		session.insert("cafelinkns.insertByMember", cafelink);
	}
	public CafeLink check(CafeLink check) {
		CafeLink cafelink = (CafeLink)session.selectOne("cafelinkns.check",check);
		return cafelink;
	}
	@SuppressWarnings("unchecked")
	public List<CafeLink> selectList1(int cafeId, String memberId) {
		String cafe_id=Integer.toString(cafeId);
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", memberId);
		map.put("cafe_id", cafe_id);
		List<CafeLink> list = session.selectList("cafelinkns.selectCafe1",map);
		return list;
	}
	@SuppressWarnings("unchecked")
	public List<CafeLink> selectList2(int cafeId, String memberId) {
		String cafe_id=Integer.toString(cafeId);
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", memberId);
		map.put("cafe_id", cafe_id);
		List<CafeLink> list = session.selectList("cafelinkns.selectCafe2",map);
		return list;
	}
	@SuppressWarnings("unchecked")
	public List<CafeLink> selectScafe(int cafe_id, List<Integer> s_hashList) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cafe_id", cafe_id);
		map.put("s_hashList", s_hashList); 
		List<CafeLink> list = session.selectList("cafelinkns.selectSimilar",map);
		return list; 
	}
	@SuppressWarnings("unchecked")
	public List<CafeLink> selectListUser(String member_id) {
		List<CafeLink> list = session.selectList("cafelinkns.selectHashUser", member_id);
		return list;
		}
}
