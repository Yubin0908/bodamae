package himedia.project.bodamae.dto;

import java.sql.Date;
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
public class User {
	private int admin_no;               // 관리자 번호       
	private int admin_check;            // 관리자 여부
	private String user_id;             // 사용자 아이디
	private String user_password;       // 사용자 비밀번호
	private String user_name;           // 사용자 이름
	private String user_gender;         // 사용자 성별
	private String user_tel;            // 사용자 전화번호
	private Date user_birthdate;        // 사용자 생년월일
	private Timestamp user_regist_date; // 사용자 가입일자
	
	public User(String user_id, String user_password, String user_name, String user_gender, String user_tel, Date user_birthdate) {
		this.user_id = user_id;
		this.user_password = user_password;
		this.user_name = user_name;
		this.user_gender = user_gender;
		this.user_tel = user_tel;
		this.user_birthdate = user_birthdate;
	}
}
