package himedia.project.bodamae.dto;

import lombok.Data;
import java.sql.Timestamp;

@Data
public class Pet {
    private int pet_no;             // 반려동물자랑 번호
    private String user_id;         // 회원 아이디
    private String pet_title;       // 반려동물자랑 제목
    private String pet_info;        // 반려동물자랑 소개글
    private String pet_img;         // 반려동물자랑 대표이미지
    private String pet_name;        // 반려동물 이름
    private String pet_detail_img;  // 반려동물자랑 상세이미지
    private Timestamp pet_date;     // 반려동물자랑 등록일

    public Pet (String user_id, String pet_title, String pet_info, String pet_img, String pet_name, String pet_detail_img) {
        this.user_id = user_id;
        this.pet_title = pet_title;
        this.pet_info = pet_info;
        this.pet_img = pet_img;
        this.pet_name = pet_name;
        this.pet_detail_img = pet_detail_img;
    }
}
