package himedia.project.bodamae.dto;

import java.sql.Timestamp;
import org.apache.ibatis.annotations.Mapper;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter @Getter
@Mapper
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	
	private int notice_no;         // 게시글 번호
	private String user_id;        // 게시글 작성자
	private String notice_title;   // 게시글 제목
	private String notice_content; // 게시글 내용
	private int notice_hits;       // 게시글 조회수
	private Timestamp notice_date; // 게시글 등록일
	
	public Notice(String user_id, String notice_title, String notice_content) {
		this.user_id = user_id;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
	}
}
