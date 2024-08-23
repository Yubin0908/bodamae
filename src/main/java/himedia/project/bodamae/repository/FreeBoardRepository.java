package himedia.project.bodamae.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import himedia.project.bodamae.dto.FreeBoard;

public interface FreeBoardRepository {

    @Select("select * from free_board")
    List<FreeBoard> findAll();

    @Select("select count(*) as count from free_board")
    int board_count();

    @Select("select * from free_board order by board_no desc limit #{limit} offset #{offSet}")
    List<FreeBoard> findByPage(@Param("limit") int limit, @Param("offSet") int offSet);
    
    @Insert("insert into free_board(user_id, board_title, board_content) values(#{user_id}, #{board_title}, #{board_content})")
    int insertWrite(@Param("user_id") String user_id, @Param("board_title") String board_title, @Param("board_content") String board_content);
    
    @Update("update free_board set board_title = #{board_title}, board_content = #{board_content} where board_no = #{board_no}")
    int updateWrite(@Param("board_title") String board_title, @Param("board_content") String board_content, @Param("board_no") int board_no);
    
    @Delete("delete from free_board where board_no = #{board_no}")
    int deleteBoard(@Param("board_no") int board_no);
   
    @Select("select * from free_board where board_no = #{board_no}")
    FreeBoard boardDetail(@Param("board_no") int board_no);
}
