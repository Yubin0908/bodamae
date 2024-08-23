package himedia.project.bodamae.controller.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	@GetMapping("/user/login")
	public String userLogin() {
		return "/user/userLogin";
	}
	
	@PostMapping("/user/login")
	public String postUserLogin(HttpSession session, @RequestParam("user_id") String user_id, @RequestParam("user_password") String user_password) {
		
		User user = repository.findByUser(user_id, user_password);
		log.info("user: {}", user);
		log.info("test>>>>>>>>>>>>>>>>>>>>");
		log.info("user_id >> " + user_id);
		log.info("user_password >> " + user_password);
		
		session.setAttribute("user", user);
		
		return "/";
	}
	
	@PostMapping("/user/login-test")
	public String postLoginTest(HttpSession session, @RequestParam("user_id") String user_id, @RequestParam("user_password") String user_password) {

		User user = repository.findByUser(user_id, user_password);

		log.info("user: {}", user);
		log.info("test>>>>>>>>>>>>>>>>>>>>");
		log.info("user_id >> " + user_id);
		log.info("user_password >> " + user_password);

		session.setAttribute(user_password, user);
		
		return "/user/login-test";
	}
}
