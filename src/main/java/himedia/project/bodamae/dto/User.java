package himedia.project.bodamae.dto;

import java.sql.Date;

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
	private Date user_regist_date;
}
