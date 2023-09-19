package com.kosa.project4.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosa.project4.notice.dao.NoticeDAO;
import com.kosa.project4.notice.model.Notice;

@Service
public class NoticeService {
	
	@Autowired
	private NoticeDAO noticeDAO;

	//공지사항 Top5
	public List<Notice> noticeTop5() throws Exception {
		return noticeDAO.noticeTop5();
	}
	
	//공지사항 페이지 목록 조회
	//인자: 페이지 번호
	//	   검색키 (X)
	public Map<String, Object> getNoticePageList(Notice notice) throws Exception {
		//1. 전체 건수를 얻는다
		notice.setTotalCount(noticeDAO.getTotalCount(notice));
		
		Map<String, Object> result = new HashMap<>();
		result.put("notice", notice);
		result.put("noticeList", noticeDAO.getNoticeList(notice));
		
		return result;
	} 

	//공지사항 글쓰기
	public boolean insertNotice(Notice notice) throws Exception {
		return noticeDAO.insertNotice(notice);
	}
	
	//공지사항 상세보기
	public Notice getNoticeDetail(int noticeId) throws Exception {
		return noticeDAO.getNoticeDetail(noticeId);
	}
	
	//조회수 올리기
	public int viewCount(int noticeId) throws Exception {		
		return noticeDAO.viewCount(noticeId);
	}

	//공지사항 수정
	public boolean updateNotice(Notice notice) throws Exception {
		return noticeDAO.updateNotice(notice);
	}

	//공지사항 삭제
	public boolean deleteNotice(int noticeId) throws Exception {
		return noticeDAO.deleteNotice(noticeId);
	}

	//체크박스 선택된 공지사항 삭제
	public boolean deleteNotices(Notice notice) throws Exception {	
	    return 0 != noticeDAO.deleteNotices(notice.getIds());
	}
	
	//체크박스 선택된 공지사항 삭제 후 리스트 불러오기
	public List<Notice> getNoticeList(Notice notice) throws Exception {
		return noticeDAO.getNoticeListBeforeN(notice, notice.getIds().length);
	}

}
