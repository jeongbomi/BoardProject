package com.kosa.project4.notice.dao;

import java.util.List;

import com.kosa.project4.notice.model.Notice;

public interface NoticeDAO {

	//Top5 출력 (메인페이지)
	public List<Notice> noticeTop5() throws Exception;
	
	//공지사항 전체 목록
	public List<Notice> getNoticeList(Notice notice) throws Exception ;
	
	//검색된 전체 건수 얻기
	public int getTotalCount(Notice notice) throws Exception;
		
	//공지사항 상세보기
	public Notice getNoticeDetail(int noticeId) throws Exception;
	
	//조회수 증가
	public int viewCount(int noticeId) throws Exception;
	
	//공지사항 글쓰기
	public boolean insertNotice(Notice notice) throws Exception; 
	
	//공지사항 수정하기
	public boolean updateNotice(Notice notice) throws Exception;
	
	//공지사항 삭제하기
	public boolean deleteNotice(int noticeId) throws Exception;

	//체크박스된 공지사항 삭제
	public int deleteNotices(String[] noticeIds) throws Exception;
	
	//체크박스된 공지사항 삭제 후 리스트 불러오기
	public List<Notice> getNoticeListBeforeN(Notice notice, int length) throws Exception;
	
}
