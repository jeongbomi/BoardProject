package com.kosa.project4.member.dao;

import com.kosa.project4.member.model.Member;

public interface MemberDAO {
	
	public int existUid(Member member) throws Exception;

	public boolean insert(Member member) throws Exception;

	public Member login(Member member) throws Exception;
	
	public String findId(Member member) throws Exception;
	
	public String findPassword(Member member) throws Exception;

	public boolean update(Member member) throws Exception;

	public boolean delete(Member member) throws Exception;


//	public List<Member> getMemberList() throws Exception;
}
