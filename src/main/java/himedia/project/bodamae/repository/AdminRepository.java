package himedia.project.bodamae.repository;

import himedia.project.bodamae.dto.Admin;
import himedia.project.bodamae.dto.User;
import org.apache.ibatis.annotations.*;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface AdminRepository {

    /* [관리자] 관리자 관리 */
    @Select("select count(*) count from user where admin_check = 1")
    int adminCount();

    @Select("select a.admin_no, a.admin_date, u.user_id, u.user_name, u.user_birthdate, u.user_regist_date from admin a join user u on a.admin_no = u.admin_no limit #{limit} offset #{offset}")
    List<Admin> findAll(@Param("limit") int limit, @Param("offset") int offset);

    @Select("select a.admin_no, a.admin_date, u.user_id, u.user_name, u.user_birthdate, u.user_regist_date from admin a join user u on a.admin_no = u.admin_no where ${option} like concat('%', #{keyword}, '%')")
    List<Admin> searchAdmin(@Param("option") String option, @Param("keyword") String keyword);

    @Select("select admin_no from admin order by admin_no desc limit 1")
    int findNewAdminNo();

    @Update("update user set admin_no = #{admin_no}, admin_check = 1 where user_id like #{user_id}")
    boolean changeUserToAdmin(@Param("user_id") String user_id, @Param("admin_no") int admin_no);

    // 관리자 번호 삭제
    @Delete("delete from admin where admin_no = #{admin_no}")
    boolean deleteAdmin(@Param("admin_no") int admin_no);
    
    // 관리자 번호 생성
    @Transactional
    @Insert("insert into admin (admin_date) values (now())")
    void createAdminNo();

    /* [관리자] 회원 관리 */
    @Select("select count(*) count from user where admin_check = 0")
    int userCount();

    @Select("select * from user where admin_check = 0 limit #{limit} offset #{offset}")
    List<User> findAllUser(@Param("limit") int limit, @Param("offset") int offset);

    @Select("select * from user where admin_check = 0 and ${option} like concat('%', #{keyword}, '%')")
    List<User> searchUser(@Param("option") String option, @Param("keyword") String keyword);

    @Update("update user set admin_no = null, admin_check = 0 where user_id like #{user_id}")
    boolean changeAdminToUser(@Param("user_id") String user_id);


    @Select("select * from user where admin_check = 0 limit #{limit} offset #{offset}")
    List<User> findAllUsers(@Param("limit") int limit, @Param("offset") int offset);

    @Select("select * from user where user_id like #{user_id}")
    User findUserById(@Param("user_id") String user_id);

    @Delete("delete from user where user_id like #{user_id}")
    boolean deleteUserById(@Param("user_id") String user_id);

    @Transactional
    @Delete("delete from free_board where user_id like #{user_id}")
    boolean deleteAllFreeBoardByUserId(@Param("user_id") String user_id);

    @Transactional
    @Delete("delete from pet where user_id like #{user_id}")
    boolean deleteAllPetByUserId(@Param("user_id") String user_id);

    @Transactional
    @Delete("delete from user where user_id like #{user_id}")
    boolean deleteByUserId(@Param("user_id") String user_id);

}
