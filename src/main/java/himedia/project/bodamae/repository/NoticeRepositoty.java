package himedia.project.bodamae.repository;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import himedia.project.bodamae.dto.Notice;

public interface NoticeRepositoty {
	
	// 등록
	@Insert("insert into notice(notice_id, notice_title, notice_content) valuse(#{ notice_id }, #{ notice_title }, #{ notice_content })")
	void save(Notice notice);
	
	// 전체 조회
	@Select("select * from notice")
	List<Notice> noticeList();
	
	// 게시글 번호 찾기
	@Select("select * from notice where notice_no like #{ notice_no }")
	Optional<Notice> findById(int notice_no);
	
	// 게시글 제목 일부 찾기
	@Select("select * from notice where notice_title like #{ notice_title }")
	List<Notice> findByTitle(String notice_title);
	
	// 게시글 수정
	@Select("update notice set notice_title = #{updateNotice.notice_title}, notice_content = #{updateNotice.notice_content} where notice_no = #{notice_no}")
	Integer update(@Param("notice_no") int notice_no, @Param("updateNotice") Notice updateNotice);
	
}
