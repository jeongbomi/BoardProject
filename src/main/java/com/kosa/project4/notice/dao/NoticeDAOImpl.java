package com.kosa.project4.notice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosa.project4.notice.model.Notice;

@Repository("noticeDAO")
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	private SqlSession sqlSession;
	
	//Top5 공지사항(메인페이지)
	@Override
	public List<Notice> noticeTop5() throws Exception {
		return sqlSession.selectList("mapper.notice.noticeTop5");
    }

	//공지사항 페이지 검색 목록
	@Override
	public List<Notice> getNoticeList(Notice notice) throws Exception {
		return sqlSession.selectList("mapper.notice.getNoticeList", notice);
	}
	
	//검색된 전체 건수 얻기
	@Override
	public int getTotalCount(Notice notice) throws Exception {
		return sqlSession.selectOne("mapper.notice.getTotalCount");
	}

	//공지사항 추가
	@Override
	public boolean insertNotice(Notice notice) throws Exception {
		return 0 != sqlSession.insert("mapper.notice.insertNotice", notice);
	}	
	
	//공지사항 상세보기
	@Override
	public Notice getNoticeDetail(int noticeId) throws Exception {
		return sqlSession.selectOne("mapper.notice.getNoticeDetail", noticeId);
	}
	
	//조회수 올리기
	@Override
	public int viewCount(int noticeId) throws Exception {
		return sqlSession.update("mapper.notice.viewCount", noticeId);
	}

	//공지사항 수정
	@Override
	public boolean updateNotice(Notice notice) throws Exception {
		return 0 != sqlSession.update("mapper.notice.updateNotice", notice);
	}

	//공지사항 삭제
	@Override
	public boolean deleteNotice(int noticeId) throws Exception {
		return 0 != sqlSession.delete("mapper.notice.deleteNotice", noticeId);
	}

	//체크박스 선택된 공지사항 삭제
	@Override
	public int deleteNotices(String[] noticeIds) throws Exception {
		return sqlSession.delete("mapper.notice.deleteNotices", noticeIds);
	}
	
	//체크박스 선택 삭제 후 다음 목록 불러오기
	public List<Notice> getNoticeListBeforeN(Notice notice, int N) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("noticeId", notice.getNoticeId());
	    paramMap.put("N", notice.getIds().length);
		return sqlSession.selectList("mapper.notice.getNoticeListBeforeN", paramMap);
	}

	

}
