package himedia.project.bodamae.dto;

import lombok.Data;

import java.sql.Date;

@Data
public class Admin {
    private int admin_no;          // 관리자 번호
    private Date admin_date;        // 관리자 등록일자
    private User user;
    private String user_id;         // 관리자 아이디
    private String user_name;       // 관리자 이름
    private String user_gender;     // 관리자 성별
    private Date user_birthdate;    // 관리자 생일
    private String user_tel;        // 관리자 전화번호
    private Date user_regist_date;  // 관리자 가입일자
}
