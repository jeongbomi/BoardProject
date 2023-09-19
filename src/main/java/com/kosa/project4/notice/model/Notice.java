package com.kosa.project4.notice.model;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	private int noticeId;		//공지사항번호
	private String title;		//제목
	private String contents;	//내용	
	private String writer_uid;	//작성자
	private Date reg_date;		//작성날짜
	private Date mod_date;		//수정날짜
	private int view_count;		//조회수
	private String delete_yn;	//삭제유무
	private String fixed_yn;	//고정유무
	private String [] ids;		//삭제시 사용될 아이디들
	
	//검색필드
	private String searchTitle = "";
	
	//페이징
	private int pageNo = 1;			// 현재 페이지 번호
	private int totalCount;			//전체 건수
	private int totalPageSize;		//현재 페이지 수
	private int pageLength = 10;	//한 페이지의 길이
	private int navSize = 10;		//페이지 하단에 출력되는 페이지의 항목수
	private int navStart = 0;		//페이지 하단에 출력되는 페이지 시작 번호
	private int navEnd = 0;			//페이지 하단에 출력되는 페이지 끝 번호
	
	public String getContentsHTML() {
		return contents.replace("\n", "<br/>");
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		//2. 전체 페이지 건수를 계산한다
		totalPageSize = (int) Math.ceil((double) totalCount / pageLength);
		
		//3. 페이지 네비게이터 시작 페이지를 계산한다
		navStart = ((pageNo - 1) / navSize) * navSize + 1;
		
		//4. 페이지 네비게이터 끝 페이지를 계산한다
		navEnd = ((pageNo - 1) / navSize + 1) * navSize;
		
		//5. 전체 페이지 보다 크면 전체 페이지 값을 변경한다
		if (navEnd >= totalPageSize) {
			navEnd = totalPageSize;
		}
	}
	
	public int getStartNo() {
		return (pageNo - 1) * pageLength + 1; 
	}
	
	public int getEndNo() {
		return pageNo * pageLength; 
	}

}
