package com.kosa.project4.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosa.project4.member.model.Member;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 아이디 중복 검사
	@Override
	public int existUid(Member member) throws Exception {
		return sqlSession.selectOne("mapper.member.existUid", member);
	}

	// 회원가입
	@Override
	public boolean insert(Member member) throws Exception {
		return 0 != sqlSession.insert("mapper.member.insert", member);
	}

	// 로그인
	@Override
	public Member login(Member member) throws Exception {
		return sqlSession.selectOne("mapper.member.login", member);
	}
	
	// 아이디 찾기
	@Override
	public String findId(Member member) throws Exception {
        return sqlSession.selectOne("mapper.member.findId", member);
    }

	// 비밀번호 찾기
	@Override
	public String findPassword(Member member) throws Exception {
        return sqlSession.selectOne("mapper.member.findPassword", member);
    }
	
	// 회원정보 수정
	@Override
	public boolean update(Member member) throws Exception {
		return 0 != sqlSession.update("mapper.member.update", member);
	}
	
	// 회원탈퇴
	@Override
	public boolean delete(Member member) throws Exception {
	    return 0 != sqlSession.delete("mapper.member.delete", member);
	}
	
	
//	
//	@Override
//	public List<Member> getMemberList() throws Exception{
//    	System.out.println("MemberDAOImpl.getMemberList()");
//    	//jdbc와 연동함 
//    	List<Member> list = new ArrayList<>();
//    	Connection conn = getConnection();
//    	if (conn == null) return list;
//    	
//    	Statement stmt = null;
//    	ResultSet rs = null;
//    	
//    	try {
//			stmt = conn.createStatement();
//			rs = stmt.executeQuery("select * from member");
//			while (rs.next()) {
//				list.add(new Member(
//						rs.getString("id"),
//						rs.getString("name"),
//						rs.getString("password"),
//						rs.getString("phone"),
//						rs.getString("email")));
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (rs != null) rs.close();
//				if (stmt != null) stmt.close();
//				if (conn != null) conn.close();
//			} catch(Exception e) {}
//		}
//    	
//        return list;
//    }
//	
	
}
