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
	private int admin_no;
	private int admin_check;
	private String user_id;
	private String user_password;
	private String user_name;
	private String user_gender;
	private String user_tel;
	private Date user_birthdate;
	private Timestamp user_regist_date;
	
	public User(String user_id, String user_password, String user_name, String user_gender, String user_tel,
			Date user_birthdate) {
		this.user_id = user_id;
		this.user_password = user_password;
		this.user_name = user_name;
		this.user_gender = user_gender;
		this.user_tel = user_tel;
		this.user_birthdate = user_birthdate;
	}
}
