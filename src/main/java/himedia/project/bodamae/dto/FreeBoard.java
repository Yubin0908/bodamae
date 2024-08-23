package himedia.project.bodamae.dto;

import lombok.Data;
import java.sql.Timestamp;

@Data
public class FreeBoard {
    private long board_no;
    private String user_id;
    private String board_title;
    private String board_content;
    private int board_hits;
    private Timestamp board_date;

    public FreeBoard (String board_content, String board_title, String user_id) {
        this.board_content = board_content;
        this.board_title = board_title;
        this.user_id = user_id;
    }
}
