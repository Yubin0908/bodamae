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
    private int board_no;         // 자유게시글 번호
    private String user_id;       // 자유게시글 작성자 id
    private String board_title;   // 자유게시글 제목
    private String board_content; // 자유게시글 내용
    private int board_hits;       // 자유게시글 조회수
    private Timestamp board_date; // 자유게시글 등록일

    public FreeBoard (String board_content, String board_title, String user_id) {
        this.board_content = board_content;
        this.board_title = board_title;
        this.user_id = user_id;
    }
}
