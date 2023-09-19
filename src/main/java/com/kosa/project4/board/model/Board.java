package com.kosa.project4.board.model;

import java.lang.reflect.Field;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private int boardId;		//게시판번호
	private String title;		//제목
	private String contents;	//내용	
	private String writer_uid;	//작성자
	private Date reg_date;		//작성날짜
	private Date mod_date;		//수정날짜
	private int view_count;		//조회수
	private String delete_yn;	//삭제여부
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
		
	
	//방법1 json객체로 받아오기 위함
	public JSONObject getJSONObject() throws Exception {
		JSONObject json = new JSONObject();
		
		Class cls = this.getClass();
		for (Field field : cls.getDeclaredFields()) {
			json.put(field.getName(), field.get(this));
		}
		
		return json;
	}
	
	//방법2
	public Map<String, Object> getMapObject() throws Exception {
        Map<String, Object> map = new HashMap<>();

        Class cls = this.getClass();
        for (Field field : cls.getDeclaredFields()) {
            map.put(field.getName(), field.get(this));
        }

        return map;
    }
}
