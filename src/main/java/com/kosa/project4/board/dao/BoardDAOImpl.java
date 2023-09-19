package com.kosa.project4.board.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosa.project4.board.model.Board;
import com.kosa.project4.notice.model.Notice;

import oracle.jdbc.internal.OracleCallableStatement;
import oracle.jdbc.internal.OracleTypes;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private  SqlSession sqlSession;

	//Top5 게시판(메인페이지)
	@Override
	public List<Board> boardTop5() throws Exception {
		return sqlSession.selectList("mapper.board.boardTop5");
    }
	
	//게시판 전체 목록
	@Override
	public List<Board> getBoardList(Board board) throws Exception {
		return sqlSession.selectList("mapper.board.getBoardList", board);
	}

	//검색된 전체 건수 얻기
	@Override
	public int getTotalCount(Board board) throws Exception {
		return sqlSession.selectOne("mapper.board.getTotalCount");
	}

	//게시판 추가
	@Override
	public boolean insertBoard(Board board) throws Exception {
		return 0 != sqlSession.insert("mapper.board.insertBoard", board);
	}
	
	//게시판 상세보기
	@Override
	public Board getBoardDetail(int boardId) throws Exception {
		return sqlSession.selectOne("mapper.board.getBoardDetail", boardId);
	}
	
	//조회수 올리기
	@Override
	public int viewCount(int boardId) throws Exception {
		return sqlSession.update("mapper.board.viewCount", boardId);
	}

	//게시판 수정
	@Override
	public boolean updateBoard(Board board) throws Exception {
		return 0 != sqlSession.update("mapper.board.updateBoard", board);
	}

	//게시판 삭제
	@Override
	public boolean deleteBoard(int boardId) throws Exception {
		return 0 != sqlSession.delete("mapper.board.deleteBoard", boardId);
	}

	//체크박스 선택된 게시판 삭제
	@Override
	public int deleteBoards(String[] boardIds) throws Exception {
		return sqlSession.delete("mapper.board.deleteBoards", boardIds);
	}

	//체크박스 선택 삭제 후 다음 목록 불러오기
	@Override
	public List<Board> getBoardListBeforeN(Board board, int N) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("boardId", board.getBoardId());
		paramMap.put("N", board.getIds().length);
		return sqlSession.selectList("mapper.board.getBoardListBeforeN", paramMap);
	}

}
