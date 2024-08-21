package himedia.project.bodamae.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import himedia.project.bodamae.dto.User;

public interface UserRepository {
	@Select("select user_id, admin_no, user_name, user_password, user_gender, user_birthdate, user_tel, user_regist_date, admin_check from user")
	List<User> userList();
	
	@Select("select * from user where user_id like #{user_id}")
	User findByUserId(@Param("user_id") String user_id);
}
