package himedia.project.bodamae.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/")
public class RegisterController {

    @GetMapping("/checkRegister")
    public String checkRegister() {
        return "register";
    }

    @GetMapping("/register")
    public String register() {
        return "register";
    }

}