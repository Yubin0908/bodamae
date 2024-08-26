package himedia.project.bodamae.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import himedia.project.bodamae.dto.User;
import himedia.project.bodamae.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user")
public class RegisterController {

	private final UserRepository userRepository;

	@Autowired
	public RegisterController(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	@GetMapping("/checkRegister")
	public String checkRegister() {
		
		return "user/register/checkRegister";
	}

	@GetMapping("/register")
	public String registerForm() {
		
		return "user/register/register";
	}

	@PostMapping("/register")
	public String register(@ModelAttribute("user") User user) {

		userRepository.save(
				user.getUser_id(), user.getUser_name(), user.getUser_password(), user.getUser_gender(),
				user.getUser_birthdate(), user.getUser_tel());
		
		return "redirect:/";
	}

	@ResponseBody
	public String idCheck(String id) {
		
		User user = userRepository.findByUserId(id);
		if (user != null) {
			return "1";
		}
		return "0";
	}
}

