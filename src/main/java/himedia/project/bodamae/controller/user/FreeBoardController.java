package himedia.project.bodamae.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import himedia.project.bodamae.dto.FreeBoard;
import himedia.project.bodamae.repository.FreeBoardRepository;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/community/board")
public class FreeBoardController {

	private final FreeBoardRepository freeBoardRepository;

	@Autowired
	public FreeBoardController(FreeBoardRepository freeBoardRepository) {
		this.freeBoardRepository = freeBoardRepository;
	}

	// [자유게시판 목록]
	@GetMapping("")
	public String board(Model model) {

		try {
			List<FreeBoard> boardList = freeBoardRepository.boardList();
			model.addAttribute("boardList", boardList);
		} catch (Exception e) {
		}

		return "user/community/freeboard/boardList";
	}

	// [자유게시판 등록페이지]
	@GetMapping("/write")
	public String write() {
		return "user/community/freeboard/boardWrite";
	}

	// [자유게시판 등록]
	@PostMapping("/writeAction")
	public String writeAction(@RequestParam("board_title") String board_title,
			@RequestParam("board_content") String board_content) {
		int result = freeBoardRepository.insertWrite("user001", board_title, board_content);
		return "redirect:/community/board";
	}

	// [자유게시판 상세]
	@GetMapping("/{board_no}")
	public String boardDetail(@PathVariable("board_no") int board_no, Model model) {

		try {
			FreeBoard freeBoard = freeBoardRepository.boardDetail(board_no).get();
			model.addAttribute("freeBoard", freeBoard);
		} catch (Exception e) {
		}

		return "user/community/freeboard/boardDetail";

	}
	
	// [자유게시판 삭제]
	@GetMapping("/delete/{board_no}")
	public String boardDelete(@PathVariable String board_no) {
		
		try {
			freeBoardRepository.deleteBoard(board_no);
		} catch(Exception e) {}
		
		return "redirect:/user/freeboard/boardList";
	}
}