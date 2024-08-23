package himedia.project.bodamae.dto;

import lombok.Data;

import java.sql.Date;

@Data
public class Admin {
    private int admin_no;
    private Date admin_date;
    private User user;
    private String user_id;
    private String user_name;
    private String user_gender;
    private Date user_birthdate;
    private String user_tel;
    private Date user_regist_date;
}
