package himedia.project.bodamae.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import himedia.project.bodamae.dto.FreeBoard;
import himedia.project.bodamae.repository.FreeBoardRepository;
import himedia.project.bodamae.service.Pagination;
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

	// [자유게시판 조회]
	@GetMapping("/search")
	public String boardSearch(@RequestParam(name = "search") String search,
			@RequestParam(name = "filter") String filter, String page, Model model) {
		int limit = 10;
		int offSet = 0;
		if (page != null && Integer.parseInt(page) != 1) {
			offSet = (Integer.parseInt(page) - 1) * limit;
		}
		try {
			List<FreeBoard> freeBoard = freeBoardRepository.findByBoard(filter, "%" + search + "%");
			model.addAttribute("freeBoard", freeBoard);
			model.addAttribute("paging", new Pagination(freeBoardRepository.board_count(), page, limit, 5));
		} catch (Exception e) {
		}

		return "user/community/freeboard/boardSearch";
	}

	// [자유게시판 목록]
	@GetMapping("")
	public String board(Model model, String page) {
		int limit = 10;
		int offSet = 0;
		if (page != null && Integer.parseInt(page) != 1) {
			offSet = (Integer.parseInt(page) - 1) * limit;
		}

		try {
			List<FreeBoard> boardList = freeBoardRepository.findByPage(limit, offSet);
			model.addAttribute("boardList", boardList);
			model.addAttribute("paging", new Pagination(freeBoardRepository.board_count(), page, limit, 5));
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
	public String writeAction(@ModelAttribute(name = "freeBoard") FreeBoard freeBoard) {

		freeBoardRepository.save(freeBoard);
		int boardId = freeBoard.getBoard_no();

		return "redirect:/community/board";
	}

	// [자유게시판 상세]
	@GetMapping("/{board_no}")
	public String boardDetail(@PathVariable("board_no") int board_no, Model model) {

		try {
			FreeBoard freeBoard = freeBoardRepository.boardDetail(board_no).get();
			int board_hit = freeBoard.getBoard_hits() + 1;

			freeBoardRepository.updateHit(board_no, board_hit);

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
		} catch (Exception e) {
		}

		return "redirect:/community/board";
	}

	// [자유게시판 수정페이지]
	@GetMapping("/edit/{board_no}")
	public String boardEditPage(@PathVariable("board_no") int board_no, Model model) {

		try {
			FreeBoard freeBoard = freeBoardRepository.boardDetail(board_no).get();
			model.addAttribute("freeBoard", freeBoard);
		} catch (Exception e) {
		}
		return "user/community/freeboard/boardEdit";
	}

	// [자유게시판 수정]
	@PostMapping("/edit/{board_no}")
	public String boardEdit(@PathVariable(name = "board_no") int board_no,
			@ModelAttribute(name = "freeBoard") FreeBoard freeBoard) {

		try {
			freeBoardRepository.updateBoard(board_no, freeBoard);
		} catch (Exception e) {
		}

		return "redirect:/community/board/{board_no}";

	}
}