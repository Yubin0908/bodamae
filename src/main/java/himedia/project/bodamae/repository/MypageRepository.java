package himedia.project.bodamae.repository;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface MypageRepository {

    @Select("select user.user_password from user where user_id like #{user_id} and user_password like #{user_password}")
    String findUserPassword(@Param("user_id") String user_id, @Param("user_password") String user_password);
}
