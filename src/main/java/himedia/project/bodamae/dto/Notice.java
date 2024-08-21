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
	private int notice_no;
	private String user_id;
	private String notice_title;
	private String notice_content;
	private int notice_hits;
	private Timestamp notice_date;
	
	public Notice(String user_id, String notice_title, String notice_content) {
		this.user_id = user_id;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
	}
}
