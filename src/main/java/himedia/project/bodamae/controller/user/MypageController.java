package himedia.project.bodamae.controller.user;

import himedia.project.bodamae.repository.FreeBoardRepository;
import himedia.project.bodamae.repository.MypageRepository;
import himedia.project.bodamae.repository.UserRepository;
import himedia.project.bodamae.service.Pagination;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/mypage")
@Slf4j
public class MypageController {

    private final FreeBoardRepository freeBoardRepository;
    private final MypageRepository myPageRepository;

    @Autowired
    public MypageController(FreeBoardRepository freeBoardRepository, MypageRepository myPageRepository) {
        this.freeBoardRepository = freeBoardRepository;
        this.myPageRepository = myPageRepository;
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

    @GetMapping("/pwCheck")
    public String emailCheck() {
        return "user/mypage/password-check";
    }

    @PostMapping("/userPasswordCheck")
    @ResponseBody
    public String userPasswordCheck(Model model, String user_id, String user_password) {
        String $user_password = myPageRepository.findUserPassword(user_id, user_password);

        if ($user_password.equals(user_password)) {
            return "pass";
        } else {
            model.addAttribute("result", 0);
            return "fail";
        }
    }

    @GetMapping("/userPasswordModify")
    public String userPasswordModify() {
        return "user/mypage/user-password-modify";
    }
}
