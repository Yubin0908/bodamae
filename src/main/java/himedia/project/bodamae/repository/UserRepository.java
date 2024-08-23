package himedia.project.bodamae.repository;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import himedia.project.bodamae.dto.User;

public interface UserRepository {
	@Select("select * from user")
	List<User> userList();
	
	@Select("select * from user where user_id like #{user_id} and user_password like #{user_password}")
	User findByUser(@Param("user_id") String user_id, @Param("user_password") String user_password);
}
