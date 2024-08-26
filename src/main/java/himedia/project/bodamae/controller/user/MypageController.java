package himedia.project.bodamae.controller.user;

import himedia.project.bodamae.dto.User;
import himedia.project.bodamae.repository.MypageRepository;
import himedia.project.bodamae.repository.UserRepository;
import himedia.project.bodamae.service.Pagination;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/mypage")
@Slf4j
public class MypageController {

    private final MypageRepository myPageRepository;
    private final UserRepository userRepository;

    @Autowired
    public MypageController(MypageRepository myPageRepository, UserRepository userRepository) {
        this.myPageRepository = myPageRepository;
        this.userRepository = userRepository;
    }

    @GetMapping("/list")
    public String list(Model model, String page, HttpSession session) {
        int limit = 15;
        int offSet = 0;
        if (page != null && Integer.parseInt(page) != 1) {
            offSet = (Integer.parseInt(page) - 1) * limit;
        }

        User user = (User) session.getAttribute("user");

        if (user != null) {
            String user_id = user.getUser_id();
            model.addAttribute("freeBoards", myPageRepository.findFreeBoard(user_id, limit, offSet));
            model.addAttribute("paging", new Pagination(myPageRepository.countFreeBoardByUserId(user_id), page, limit, 10));
        }
        return "user/mypage/list";
    }

    @GetMapping("/pwCheck")
    public String userPasswordCheck() {
        return "user/mypage/password-check";
    }

    @PostMapping("/userPasswordCheck")
    @ResponseBody
    public String userPasswordCheck(Model model, String user_id, String user_password, String modify) {
        String $user_password = myPageRepository.findUserPassword(user_id, user_password);

        log.info("$user_password: {}", $user_password);
        log.info("user_password: {}", user_password);
        log.info("modify: {}", modify);

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

    @PostMapping("/userPasswordModify")
    public String userPasswordModify(HttpSession session, String user_id, String user_password) {
        userRepository.updatePassword(user_id, user_password);
        session.invalidate();
        return "redirect:/";
    }
}
