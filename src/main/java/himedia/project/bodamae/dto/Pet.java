package himedia.project.bodamae.dto;

import lombok.Data;
import java.sql.Timestamp;

@Data
public class Pet {
    private int pet_no;
    private String user_id;
    private String pet_title;
    private String pet_info;
    private String pet_img;
    private String pet_name;
    private String pet_detail_img;
    private Timestamp pet_date;

    public Pet (String user_id, String pet_title, String pet_info, String pet_img, String pet_name, String pet_detail_img) {
        this.user_id = user_id;
        this.pet_title = pet_title;
        this.pet_info = pet_info;
        this.pet_img = pet_img;
        this.pet_name = pet_name;
        this.pet_detail_img = pet_detail_img;
    }
}
