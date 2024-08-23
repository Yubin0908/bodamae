package himedia.project.bodamae.repository;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import himedia.project.bodamae.dto.User;

public interface UserRepository {
	@Insert("insert into user(user_id, user_name, user_password, user_gender, user_birthdate, user_tel) values(#{ user_id }, #{ user_name }, #{ user_password }, #{ user_gender }, #{ user_birthdate }, #{ user_tel })")
	void save(
			@Param("user_id") String user_id, 
			@Param("user_name") String user_name, 
			@Param("user_password") String user_password, 
			@Param("user_gender") String user_gender, 
			@Param("user_birthdate") Date user_birthdate, 
			@Param("user_tel") String user_tel
	);
	
	@Select("select * from user")
	List<User> userList();
	
	@Select("select * from user where user_id like #{ user_id }")
	User findByUserId(String user_id);

	
}
