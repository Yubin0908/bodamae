package himedia.project.bodamae.controller.user;

import himedia.project.bodamae.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import himedia.project.bodamae.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@Slf4j
@RequestMapping("/user")
public class UserController {
    private final UserRepository userRepository;

    @Autowired
    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/login")
    public String loginForm() {
        return "user/userLogin";
    }

    @PostMapping("/login")
    public String login(HttpSession session, String user_id, String user_password, Model model) {
        User user = userRepository.findByUserId(user_id);
        log.info("user: " + user);
        if (user != null && user_password.equals(user.getUser_password())) {
            session.setAttribute("user", user);
        } else {
            model.addAttribute("loginFailMsg", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "user/userLogin";
        }

        return "redirect:/";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
