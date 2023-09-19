package com.kosa.project4.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosa.project4.board.dao.BoardDAO;
import com.kosa.project4.board.model.Board;
import com.kosa.project4.notice.model.Notice;

@Service
public class BoardService {
	
	@Autowired
	private BoardDAO boardDAO;

	//게시판 Top5
	public List<Board> boardTop5() throws Exception {
		return boardDAO.boardTop5();
	}
	
	//게시판 페이지 목록 조회
	//인자: 페이지 번호
	//	   검색키 (X)
	public Map<String, Object> getBoardPageList(Board board) throws Exception {
		//1. 전체 건수를 얻는다
		board.setTotalCount(boardDAO.getTotalCount(board));
		
		Map<String, Object> result = new HashMap<>();
		result.put("board", board);
		result.put("boardList", boardDAO.getBoardList(board));
		
		return result;
	}

	//게시판 글쓰기
	public boolean insertBoard(Board board) throws Exception {
		return boardDAO.insertBoard(board);
	}
	
	//게시판 상세보기
	public Board getBoardDetail(int boardId) throws Exception {
		return boardDAO.getBoardDetail(boardId);
	}
	
	//조회수 올리기
	public int viewCount(int boardId) throws Exception {
		return boardDAO.viewCount(boardId);
	}

	//게시판 수정
	public boolean updateBoard(Board board) throws Exception {
		return boardDAO.updateBoard(board);
	}

	//게시판 삭제
	public boolean deleteBoard(int boardId) throws Exception {
		return boardDAO.deleteBoard(boardId);
	}
	
	//체크박스 선택된 게시판 삭제
	public boolean deleteBoards(Board board) throws Exception {
		return 0!= boardDAO.deleteBoards(board.getIds());
	}
	
	//체크박스 선택된 공지사항 삭제 후 리스트 불러오기
	public List<Board> getBoardList(Board board) throws Exception {
		return boardDAO.getBoardListBeforeN(board, board.getIds().length);
	}

}
