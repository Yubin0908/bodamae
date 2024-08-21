package himedia.project.bodamae.repository;

import himedia.project.bodamae.dto.FreeBoard;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface FreeBoardRepository {

    @Select("select * from free_board")
    List<FreeBoard> findAll();

    @Select("select count(*) as count from free_board")
    int board_count();

    @Select("select * from free_board order by board_no desc limit #{limit} offset #{offSet}")
    List<FreeBoard> findByPage(@Param("limit") int limit, @Param("offSet") int offSet);
}
