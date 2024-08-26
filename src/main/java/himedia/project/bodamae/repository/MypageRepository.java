package himedia.project.bodamae.repository;

import himedia.project.bodamae.dto.FreeBoard;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface MypageRepository {

    @Select("select user.user_password from user where user_id like #{user_id} and user_password like #{user_password}")
    String findUserPassword(@Param("user_id") String user_id, @Param("user_password") String user_password);

    @Select("select * from free_board where user_id like #{user_id} order by board_no desc limit #{limit} offset #{offset}")
    List<FreeBoard> findFreeBoard(@Param("user_id") String user_id, @Param("limit") int limit, @Param("offset") int offset);

    @Select("select count(*) count from free_board where user_id like #{user_id}")
    int countFreeBoardByUserId(@Param("user_id") String user_id);
}
