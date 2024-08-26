package himedia.project.bodamae.repository;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.transaction.annotation.Transactional;

import himedia.project.bodamae.dto.Notice;

public interface NoticeRepositoty {
	
	// 등록
	@Insert("insert into notice(user_id, notice_title, notice_content) values(#{user_id}, #{notice_title}, #{notice_content})")
	@Options(useGeneratedKeys = true, keyProperty = "notice_no")
	void save(Notice notice);
	
	// 전체 조회
	@Select("select * from notice")
	List<Notice> noticeList();
	
	// 조회수
	@Transactional
	@Select("update notice set notice_hits = #{ notice_hits } where notice_no = #{ notice_no }")
	List<Notice> updateCnt(@Param("notice_no") int notice_no, @Param("notice_hits") int notice_hits);
	
	// 게시글 번호 찾기
	@Select("select * from notice where notice_no like #{ notice_no }")
	Optional<Notice> findById(int notice_no);
	
	// 게시글 조회 - 게시글 번호, 글 제목
	@Select("select * from notice where ${ filter } like #{ search }")
	List<Notice> findByNotice(@Param("filter") String filter, @Param("search") String search);
	
	// 게시글 수정
	@Select("update notice set notice_title = #{updateNotice.notice_title}, notice_content = #{updateNotice.notice_content} where notice_no = #{notice_no}")
	Integer updateByNotice(@Param("notice_no") int notice_no, @Param("updateNotice") Notice updateNotice);
	
	// 게시글 삭제
	@Delete("delete from notice where notice_no like #{ notice_no }")
	boolean deleteByNotice(@Param("notice_no") String notice_no);
	
}
