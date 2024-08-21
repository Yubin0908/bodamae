package himedia.project.bodamae.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import himedia.project.bodamae.dto.Notice;
import himedia.project.bodamae.repository.NoticeRepositoty;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("admin/notice")
public class NoticeController {
	
	private final NoticeRepositoty noticeRepositoty;
	
	@Autowired
	public NoticeController(NoticeRepositoty noticeRepositoty) {
		this.noticeRepositoty = noticeRepositoty;
	}
	
	// [공지사항 목록]
	@GetMapping("")
	public String noticeList(Model model) {
		log.info("<< 공지사항 들어옴 >>");
		List<Notice> noticeList = noticeRepositoty.noticeList();
		model.addAttribute("noticeList", noticeList);
		
		return "admin/notice/notice";
	}
	
	// [공지사항 상세]
	@GetMapping("/{notice_no}")
	public String noticeDetail(@PathVariable("notice_no") int notice_no, Model model) {
		
		Notice notice = noticeRepositoty.findById(notice_no).get();
		model.addAttribute("notice", notice);
		
		return "admin/notice/noticeDetail";
	}
	
	// [공지사항 수정 페이지]
	@GetMapping("/edit/{notice_no}")
	public String noticeEditForm(@PathVariable("notice_no") int notice_no, Model model) {

		Notice notice = noticeRepositoty.findById(notice_no).get();
		model.addAttribute("notice", notice);
		
		log.info("일단 수정 페이지 완료");
		
		return "admin/notice/noticeEdit";
	}
	
	// [공지사항 수정]
	@PostMapping("/edit/{notice_no}")
	public String noticeEdit(@PathVariable(name = "notice_no") int notice_no, 
			@ModelAttribute(name="notice") Notice notice) {
		
		noticeRepositoty.update(notice_no, notice);
		
		return "redirect:/admin/notice/{notice_no}";
	}
	
	
	// [공지사항 등록 페이지]
	@GetMapping("/add")
	public String noticeAddForm(Model model) {
		
		return "admin/notice/noticeAdd";
	}
	
	// [공지사항 등록]
	@PostMapping("/add") 
	public String noticeAdd(@ModelAttribute(name = "notice") Notice notice) {
		
	    if (notice == null) {
	        log.info("notice 객체가 null입니다.");
	    } else {
	        log.info(notice.getNotice_title(), notice.getNotice_content());
	    }
		noticeRepositoty.save(notice);
		
		return "redirect:/store/items/" + notice.getNotice_no();
	}
}
