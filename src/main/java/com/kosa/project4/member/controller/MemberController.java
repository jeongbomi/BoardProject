package com.kosa.project4.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosa.project4.member.model.Member;
import com.kosa.project4.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;


	//회원가입
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insert(@RequestBody Member member) throws Exception {
		System.out.println("회원가입");
		System.out.println(member);
		
		Map<String, Object> result = new HashMap<>();
        
        if (memberService.insert(member)) {
            System.out.println("회원 가입이 성공되었습니다\n");
            result.put("message", "회원 가입이 성공되었습니다");
        } else {
            System.out.println("아이디 중복으로 회원 가입이 실패되었습니다\n");
            result.put("message", "아이디 중복으로 회원 가입이 실패되었습니다");
        }

        return result;
	}
	

	//아이디중복확인
	@RequestMapping(value = "/existUid.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> existUid(@RequestBody Member member) throws Exception {
		System.out.println("아이디 중복 확인");

        Map<String, Object> result = new HashMap<>();

        if (memberService.existUid(member)) {
            System.out.println("이미 사용 중인 아이디입니다\n");
            result.put("message", "이미 사용 중인 아이디입니다");
        } else {
            System.out.println("사용 가능한 아이디입니다\n");
            result.put("message", "사용 가능한 아이디입니다");
        }

        return result;
	}
	
	
	//로그인
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> login(@RequestBody Member member, HttpSession session) throws Exception {
		System.out.println("로그인 시도");
        
        Map<String, Object> result = new HashMap<>();
        
        Member loginMember = memberService.login(member, session);
        
        if(loginMember != null && loginMember.isEqualPassword(member)) {
        	session.setAttribute("loginMember", loginMember);
        	result.put("status", true);       
        	result.put("message", "로그인 성공");
        	System.out.println("로그인 성공  -> " + loginMember + "\n");
        } else {
        	result.put("status", false);
        	result.put("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
        	System.out.println("아이디 또는 비밀번호가 일치하지 않습니다.\n");
        }
        return result;
    }
	

	// 로그아웃
    @RequestMapping(value = "/logout.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> logout(HttpSession session) {
    	Map<String, Object> result = new HashMap<>();
    	session.removeAttribute("loginMember");	// 로그인된 멤버 삭제
    	session.invalidate(); // 세션 무효화
        result.put("message", "로그아웃되었습니다.");
        System.out.println("로그아웃");
        return result;
    	
    }
	
    
	//아이디 찾기
    @RequestMapping(value = "/findId.do", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> findId(@RequestBody Member member) throws Exception {
		System.out.println("아이디찾기 시도");

		Map<String, Object> result = new HashMap<>();
		
		String findId = memberService.findId(member);

	    if (findId != null) {
	        result.put("status", true);
	        result.put("message", "회원님의 아이디: " + findId);
	    	System.out.println("회원님의 아이디: " + findId + "\n");
	    } else {
	        result.put("status", false);
	        result.put("message", "일치하는 정보로 아이디를 찾을 수 없습니다.");
	    	System.out.println("일치하는 정보로 아이디를 찾을 수 없습니다.\n");
	    }

	    return result;
	    
	}

	//비밀번호 찾기
    @RequestMapping(value = "/findPassword.do", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> findPassword(@RequestBody Member member) throws Exception {
    	System.out.println("비밀번호찾기 시도");

		Map<String, Object> result = new HashMap<>();
		
		String findPassword = memberService.findPassword(member);

	    if (findPassword != null) {
	        result.put("status", true);
	        result.put("message", "회원님의 비밀번호: " + findPassword);
	    	System.out.println("회원님의 비밀번호: " + findPassword + "\n");

	    } else {
	        result.put("status", false);
	        result.put("message", "일치하는 정보로 비밀번호를 찾을 수 없습니다.");
	    	System.out.println("일치하는 정보로 비밀번호를 찾을 수 없습니다.\n");
	    }

	    return result;
	}

	//회원정보 수정
    @RequestMapping(value = "/update.do", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> update(@RequestBody Member updatedMember, HttpSession session) throws Exception {
		System.out.println("회원정보 수정");
		
		Map<String, Object> result = new HashMap<>();
		
	    // 정보 업데이트
	    if (memberService.update(updatedMember)) {
	    	
	        // 로그인 정보 업데이트
	        session.setAttribute("loginMember", updatedMember);
	        
	        result.put("status", true);
	        result.put("message", "회원정보가 수정되었습니다.");
	        System.out.println("회원정보가 수정되었습니다.");
	        
	    } else {
	        result.put("status", false);
	        result.put("message", "회원정보 수정에 실패했습니다.");
	    	System.out.println("회원정보 수정에 실패했습니다.");
	    }
		
		return result;
	}
	
	// 회원탈퇴
    @RequestMapping(value = "/delete.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> delete(@RequestBody Member member, HttpSession session) throws Exception {
    	System.out.println("회원탈퇴 시도");

		Map<String, Object> result = new HashMap<>();

		// 세션에서 로그인된 사용자 정보 가져오기
        Member loginMember = (Member) session.getAttribute("loginMember");
        
        // 로그인된 회원의 id와 삭제하려는 회원의 id가 일치하는 경우에만 삭제 시도
        if (loginMember != null && member != null && loginMember.getId().equals(member.getId())) {
            boolean success = memberService.delete(loginMember);

            if (success) {
                result.put("status", true);
                result.put("message", "회원 정보가 삭제되었습니다");
                System.out.println("회원 정보 삭제\n");

                // 세션 무효화 (로그아웃)
                session.invalidate();
            } else {
                result.put("status", false);
                result.put("message", "일치하는 회원 정보가 없습니다");
                System.out.println("일치하는 회원 정보가 없습니다\n");
            }
        } else {
            result.put("status", false);
            result.put("message", "회원 정보 삭제 권한이 없습니다");
            System.out.println("회원 정보 삭제 권한이 없습니다");
        }

	    return result;
    }

//    //'admin'관리자만 볼 수 있는
//    //전체회원목록보기 화면
//	public String memberList(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("memberList()");
//		
//		List<Member> memberList = memberService.getMemberList();
//        
//        // memberList를 request 속성에 설정하여 JSP에서 사용할 수 있도록 함
//        request.setAttribute("memberList", memberList);
//        
//		return "member/memberListForm.jsp";
//	}
}
