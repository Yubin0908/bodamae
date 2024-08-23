package himedia.project.bodamae.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import himedia.project.bodamae.repository.FreeBoardRepository;

@Controller
@RequestMapping("/community/board")
public class FreeBoardController {

	private final FreeBoardRepository repository;
	
	@Autowired
	public FreeBoardController(FreeBoardRepository repository) {
		this.repository = repository;
	}
	
	@GetMapping("")
	public String board() {
		return "user/community/freeboard/board";
	}


	@GetMapping("/write")
	public String write() {
		return "user/community/freeboard/write";
	}
	
	@PostMapping("/writeAction")
	public String writeAction( @RequestParam("board_title") String board_title, @RequestParam("board_content") String board_content) {
		int result = repository.insertWrite("user001", board_title, board_content);
		return "redirect:/community/board";
	}
	
	
}
