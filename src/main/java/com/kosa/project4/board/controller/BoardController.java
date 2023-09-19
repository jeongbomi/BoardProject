package com.kosa.project4.board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosa.project4.board.model.Board;
import com.kosa.project4.board.service.BoardService;
import com.kosa.project4.notice.model.Notice;

/*
 * 더보기
 * ajax 방법 -> 1. 서버에서 html 생성해서 클라이언트에서 출력
 * 			-> 2. 순수 DATA만 서버에 전달하고 클라이언트에서 HTML 생성 출력 //서버의 부담이 적음
 * 
 * 1. DB에 자료를 얻는 방법
 * 		1. 처음 10건 추출하는 방법
 * 		2. 다음 10건을 얻는 방법
 * 
 * 2. 순수 DATA만 서버에 전달
 * 
 * 3. 클라이언트에서 전달받는 DATA를 이용해서 HTML 출력
 */

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	//게시판 전체목록리스트
	@RequestMapping("/boardList.do")
	public String boardList(Board board, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("게시판 페이징 목록 띄우기\n");
		
		request.setAttribute("result", boardService.getBoardPageList(board));
		
		return "board/boardList";
	}
	
	//게시판 글쓰기
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insert(@RequestBody Board board) throws Exception {
		System.out.println("게시판 글쓰기");
		
		Map<String, Object> result = new HashMap<>();

    	if(boardService.insertBoard(board)) {
    		result.put("status", true);
    		result.put("message", "게시판 글이 등록되었습니다");
    	} else {
    		result.put("status", false);
    		result.put("message", "게시판 작성 중 오류가 발생하였습니다");
    	}
		
		return result;
	}
	
	//게시판 상세보기
	@RequestMapping(value = "/detail.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> boardView(@RequestBody Board board) throws Exception {
		System.out.println("게시판 상세보기");
		
		Map<String, Object> result = new HashMap<>();
		
		try { 
			System.out.println("게시판 번호 _" + board.getBoardId() + "번 조회");
			System.out.println("조회수 올리기\n");
			boardService.viewCount(board.getBoardId());
			
			result.put("status", true);
			result.put("board", boardService.getBoardDetail(board.getBoardId()));
        
		} catch (Exception e) { 
        	e.printStackTrace();
        }
		
		return result;
	}

	//게시판 수정
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> updateBoard(@RequestBody Board board) throws Exception {
		System.out.println("게시판  수정");
		
		Map<String, Object> result = new HashMap<>();

		if (boardService.updateBoard(board)) {
			result.put("status", true);
	    	result.put("message", "게시판 글이 수정되었습니다");
	    	System.out.println("게시판 글이 수정되었습니다");
		} else {
			result.put("status", false);
	    	result.put("message", "게시판 수정 중 오류가 발생하였습니다");
	    	System.out.println("게시판 수정 중 오류가 발생하였습니다");
		}
		
		return result;
	}
	
	//게시판 삭제
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> deleteBoard(@RequestBody Board board) throws Exception {
		System.out.println("게시판 삭제 -> 게시판 번호: " + board.getBoardId());
			    
		Map<String, Object> result = new HashMap<>();
		
		if (boardService.deleteBoard(board.getBoardId())) {
    		result.put("status", true);
    		result.put("message", "게시판 글이 삭제되었습니다");
    		System.out.println("게시판 글이 삭제되었습니다\n");
    	} else {
    		result.put("status", false);
    		result.put("message", "게시판 삭제 중 오류가 발생하였습니다");
    		System.out.println("게시판 삭제 중 오류가 발생하였습니다\n");
    	}
    	
		return result;
	}
	
	//게시판 체크선택 삭제
	@RequestMapping(value = "/deleteBoards.do", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> deleteBoards(@RequestBody Board board) throws Exception {
		System.out.println("게시판 체크선택 삭제");
			    
	    Map<String, Object> result = new HashMap<>();
	    
	    if (boardService.deleteBoards(board)) {
	    	result.put("status", true);
	    	result.put("message", "게시판 선택글이 삭제되었습니다");
	    	
	    	System.out.println("게시판  삭제 후 삭제된 갯수만큼 리스트 불러오기");
	    	// 삭제 작업이 성공하면 boardService를 사용하여 게시판 리스트를 다시 가져와서 결과에 추가합니다.
	        result.put("boardList", boardService.getBoardList(board));
	        System.out.println(boardService.getBoardList(board));
	    } else {
	    	result.put("status", false);
	    	result.put("message", "게시판 선택삭제 중 오류가 발생하였습니다");
	    }
    	
		return result;
	}
}
