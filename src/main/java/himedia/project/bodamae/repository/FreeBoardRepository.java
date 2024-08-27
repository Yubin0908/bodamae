package himedia.project.bodamae.repository;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.transaction.annotation.Transactional;

import himedia.project.bodamae.dto.FreeBoard;

public interface FreeBoardRepository {

    @Select("select * from free_board")
    List<FreeBoard> boardList();

    @Select("select count(*) as count from free_board")
    int board_count();

    @Select("select * from free_board order by board_no desc limit #{limit} offset #{offSet}")
    List<FreeBoard> findByPage(@Param("limit") int limit, @Param("offSet") int offSet);
    
    // 등록
    @Insert("insert into free_board(user_id, board_title, board_content) values(#{user_id}, #{board_title}, #{board_content})")
    @Options(useGeneratedKeys = true, keyProperty = "board_no")
    void save(FreeBoard freeBoard);
    
    // 게시글 조회
    @Select("select * from free_board where ${ filter } like #{ search }")
    List<FreeBoard> findByBoard(@Param("filter") String filter, @Param("search") String search);
    
    
    // 수정
    @Select("update free_board set board_title = #{updateBoard.board_title}, board_content = #{updateBoard.board_content} where board_no = #{board_no}")
    Integer updateBoard(@Param("board_no") int board_no, @Param("updateBoard") FreeBoard updateBoard);
    
    // 삭제
    @Delete("delete from free_board where board_no = #{board_no}")
    boolean deleteBoard(@Param("board_no") String board_no);
   
    @Select("select * from free_board where board_no = #{board_no}")
    Optional<FreeBoard> boardDetail(int board_no);
    
    // 조회수
    @Transactional
	@Select("update free_board set board_hits = #{ board_hits } where board_no = #{ board_no }")
	List<FreeBoard> updateHit(@Param("board_no") int board_no, @Param("board_hits") int board_hits);
}
