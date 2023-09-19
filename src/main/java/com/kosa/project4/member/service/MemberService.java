package com.kosa.project4.member.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosa.project4.member.dao.MemberDAO;
import com.kosa.project4.member.model.Member;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	// 아이디 중복 검사
	public boolean existUid(Member member) throws Exception {
		int count = memberDAO.existUid(member);
	    return count > 0;
	}
	
	// 회원가입
	public boolean insert(Member member) throws Exception {
		return memberDAO.insert(member);
	}

	// 로그인
	public Member login(Member member, HttpSession session) throws Exception{
		return memberDAO.login(member);
	}
	
	// 아이디 찾기
	public String findId(Member member) throws Exception {
		return memberDAO.findId(member);
	}

	// 비밀번호 찾기
	public String findPassword(Member member) throws Exception {
		return memberDAO.findPassword(member);
	}
	
	// 회원정보 수정
	public boolean update(Member member) throws Exception {
        return memberDAO.update(member);
    }
	
	// 회원탈퇴
	public boolean delete(Member member) throws Exception {
        return memberDAO.delete(member);
    }
//	
//	public List<Member> getMemberList() throws Exception {
//		return memberDAO.getMemberList();
//	}



}
