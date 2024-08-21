package himedia.project.bodamae.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import himedia.project.bodamae.dto.User;
import himedia.project.bodamae.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UserController {
	private final UserRepository repository;

	@Autowired
	public UserController(UserRepository repository) {
		this.repository = repository;
	}

	@GetMapping("/login")
	public String login(@RequestParam(name = "user_id") String user_id, @RequestParam(name = "user_password") String user_password, Model model) {
		User user = repository.findByUserId(user_id);
		model.addAttribute("user_id", user_id);
		log.info("user : {}", user);
		return "login";
	}
}
