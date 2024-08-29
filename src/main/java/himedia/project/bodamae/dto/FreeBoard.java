package himedia.project.bodamae.dto;

import java.sql.Timestamp;
import org.apache.ibatis.annotations.Mapper;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter @Getter
@Mapper
@NoArgsConstructor
@AllArgsConstructor
@Data
public class FreeBoard {
    private int board_no;
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
