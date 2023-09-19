package com.kosa.project4.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosa.project4.notice.model.Notice;
import com.kosa.project4.notice.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	//공지사항 페이징 전체 리스트
	@RequestMapping("/noticeList.do")
	public String noticeList(Notice notice, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("공지사항 페이징 목록 띄우기\n");
		request.setAttribute("result", noticeService.getNoticePageList(notice));
        
		return "notice/noticeList";
	}
	
	//공지사항 글쓰기
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insert(@RequestBody Notice notice) throws Exception {
		System.out.println("공지사항 글쓰기");
		
		Map<String, Object> result = new HashMap<>();

    	if(noticeService.insertNotice(notice)) {
    		result.put("status", true);
    		result.put("message", "공지사항 글이 등록되었습니다");
    	} else {
    		result.put("status", false);
    		result.put("message", "공지사항 작성 중 오류가 발생하였습니다");
    	}
		
		return result;
	}

	//공지사항 상세보기
	@RequestMapping(value = "/detail.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> noticeView(@RequestBody Notice notice) throws Exception {
		System.out.println("공지사항 상세보기");
		
		Map<String, Object> result = new HashMap<>();
		
		try { 
			System.out.println("공지사항 번호 _" + notice.getNoticeId() + "번 조회");
			System.out.println("조회수 올리기\n");
			noticeService.viewCount(notice.getNoticeId());
			
			result.put("status", true);
			result.put("notice", noticeService.getNoticeDetail(notice.getNoticeId()));
			
		} catch (Exception e) { 
        	e.printStackTrace();
        }
		
		return result;
	}

	//공지사항 수정
    @RequestMapping(value = "/update.do", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> updateNotice(@RequestBody Notice notice) throws Exception {
		System.out.println("공지사항 수정");
		
		Map<String, Object> result = new HashMap<>();
		
		if (noticeService.updateNotice(notice)) {
			result.put("status", true);
	    	result.put("message", "공지사항 글이 수정되었습니다");
	    	System.out.println("공지사항 글이 수정되었습니다");
		} else {
			result.put("status", false);
	    	result.put("message", "공지사항 수정 중 오류가 발생하였습니다");
	    	System.out.println("공지사항 수정 중 오류가 발생하였습니다");
		}
		
		return result;
	}
	
	//공지사항 삭제
    @RequestMapping(value = "/delete.do", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> deleteNotice(@RequestBody Notice notice) throws Exception {
		System.out.println("공지사항 삭제 -> 공지사항 번호: " + notice.getNoticeId());

		Map<String, Object> result = new HashMap<>();
		
    	if (noticeService.deleteNotice(notice.getNoticeId())) {
    		result.put("status", true);
    		result.put("message", "공지사항 글이 삭제되었습니다");
    		System.out.println("공지사항 글이 삭제되었습니다\n");
    	} else {
    		result.put("status", false);
    		result.put("message", "공지사항 삭제 중 오류가 발생하였습니다");
    		System.out.println("공지사항 삭제 중 오류가 발생하였습니다\n");
    	}
    	
		return result;
	}
	
	
	//공지사항 체크선택 삭제
    @RequestMapping(value = "/deleteNotices.do", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> deleteNotices(@RequestBody Notice notice) throws Exception {
		System.out.println("공지사항 체크선택 삭제");
		
		Map<String, Object> result = new HashMap<>();
		
	    if (noticeService.deleteNotices(notice)) {
	    	result.put("status", true);
	    	result.put("message", "공지사항 선택글이 삭제되었습니다");
	    	
	    	System.out.println("공지사항 삭제 후 삭제된 갯수만큼 리스트 불러오기");
	    	// 삭제 작업이 성공하면 noticeService를 사용하여 공지사항 리스트를 다시 가져와서 결과에 추가합니다.
	        result.put("noticeList", noticeService.getNoticeList(notice));
	        System.out.println(noticeService.getNoticeList(notice));
	    } else {
	    	result.put("status", false);
	    	result.put("message", "공지사항 선택삭제 중 오류가 발생하였습니다");
	    }
    	
		return result;
	}
}
