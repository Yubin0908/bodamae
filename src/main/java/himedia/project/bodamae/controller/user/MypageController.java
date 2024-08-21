package himedia.project.bodamae.controller.user;

import himedia.project.bodamae.repository.FreeBoardRepository;
import himedia.project.bodamae.service.Pagination;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
@Slf4j
public class MypageController {

    private final FreeBoardRepository freeBoardRepository;

    @Autowired
    public MypageController(FreeBoardRepository freeBoardRepository) {
        this.freeBoardRepository = freeBoardRepository;
    }

    @GetMapping("/list")
    public String list(Model model, String page) {
        int limit = 15;
        int offSet = 0;
        if (page != null && Integer.parseInt(page) != 1) {
            offSet = (Integer.parseInt(page) - 1) * limit;
        }

        model.addAttribute("freeBoards", freeBoardRepository.findByPage(limit, offSet));
        model.addAttribute("paging", new Pagination(freeBoardRepository.board_count(), page, limit, 10));
        return "user/mypage/list";
    }

    @GetMapping("/emailCheck")
    public String emailCheck() {
        return "user/mypage/email-check";
    }

    @PostMapping("/emailCheck")
    public String emailCheck(Model model, String email) {

        return "user/mypage/user-password-modify";
    }
}
