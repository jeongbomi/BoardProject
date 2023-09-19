package com.kosa.project4.main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.project4.board.model.Board;
import com.kosa.project4.board.service.BoardService;
import com.kosa.project4.notice.model.Notice;
import com.kosa.project4.notice.service.NoticeService;

@Controller
public class MainController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private NoticeService noticeService;

	@RequestMapping("main.do")
	public String main(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	System.out.println("메인 홈페이지\n");
		
		try { 
			List<Notice> noticeTop5 = noticeService.noticeTop5();
			request.setAttribute("noticeTop5", noticeTop5);
        	
        	List<Board> boardTop5 = boardService.boardTop5();
        	request.setAttribute("boardTop5", boardTop5);
        	
        } catch (Exception e) { 
        	e.printStackTrace();
        }

		return "main";
		
	} // list

} // end class
