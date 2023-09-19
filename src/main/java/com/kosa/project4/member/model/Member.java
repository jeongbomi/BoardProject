package com.kosa.project4.member.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private String id;			//아이디
	private String password;	//비밀번호
	private String name;		//이름
	private String phone;		//전화번호
	private String email;		//이메일
	
	//로그인할때 비밀번호 가져오는 함수
	public boolean isEqualPassword(Member member) {
		return password.equals(member.getPassword());
	}
}