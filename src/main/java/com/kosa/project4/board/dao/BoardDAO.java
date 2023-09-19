package com.kosa.project4.board.dao;

import java.util.List;
import org.json.JSONObject;

import com.kosa.project4.board.model.Board;
import com.kosa.project4.notice.model.Notice;

public interface BoardDAO {

	//Top5 출력 (메인페이지)
	public List<Board> boardTop5() throws Exception;
	
	//게시판 전체 목록
	public List<Board> getBoardList(Board board) throws Exception;

	//검색된 전체 건수 얻기
	public int getTotalCount(Board board) throws Exception;
	
	//게시판 글쓰기
	public boolean insertBoard(Board board) throws Exception; 
	
	//게시판 상세보기
	public Board getBoardDetail(int boardId) throws Exception;
	
	//조회수 증가
	public int viewCount(int boardId) throws Exception;
	
	//게시판 수정하기
	public boolean updateBoard(Board board) throws Exception;
	
	//게시판 삭제하기
	public boolean deleteBoard(int boardId) throws Exception;

	//체크박스된 게시판 삭제
	public int deleteBoards(String[] boardIds) throws Exception;
	
	//체크박스된 게시판 삭제 후 리스트 불러오기
	public List<Board> getBoardListBeforeN(Board board, int length) throws Exception;
	
	
}
