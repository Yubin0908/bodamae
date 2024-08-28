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
import org.springframework.web.bind.annotation.RequestParam;
import himedia.project.bodamae.dto.Notice;
import himedia.project.bodamae.repository.NoticeRepositoty;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("admin/noticeList")
public class AdminNoticeController {
	
	private final NoticeRepositoty noticeRepositoty;
	
	@Autowired
	public AdminNoticeController(NoticeRepositoty noticeRepositoty) {
		this.noticeRepositoty = noticeRepositoty;
	}
	
	// [공지사항 목록]
	@GetMapping("")
	public String noticeList(Model model) {
		
		try {
			List<Notice> noticeList = noticeRepositoty.noticeList();
			model.addAttribute("noticeList", noticeList);
		} catch (Exception e) { }
		
		return "admin/notice/noticeList";
	}
	
	// [공지사항 조회]
	@GetMapping("/search")
	public String noticeSearch(@RequestParam(name="search") String search, 
			@RequestParam (name="filter") String filter, Model model) {
		
		try {
			List<Notice> notice = noticeRepositoty.findByNotice(filter, "%" + search + "%");
			model.addAttribute("notice", notice);
		} catch (Exception e) { }
		
		return "admin/notice/noticeSearch";
	}
	
	// [공지사항 상세]
	@GetMapping("/{notice_no}")
	public String noticeDetail(@PathVariable("notice_no") int notice_no, Model model) {
		
		try {
			Notice notice = noticeRepositoty.findById(notice_no).get();
			model.addAttribute("notice", notice);
		} catch (Exception e) { }
		
		return "admin/notice/noticeDetail";
	}
	
	// [공지사항 수정 페이지]
	@GetMapping("/edit/{notice_no}")
	public String noticeEditForm(@PathVariable("notice_no") int notice_no, Model model) {

		try {
			Notice notice = noticeRepositoty.findById(notice_no).get();
			model.addAttribute("notice", notice);
		} catch (Exception e) { }
		
		return "admin/notice/noticeEdit";
	}
	
	// [공지사항 수정]
	@PostMapping("/edit/{notice_no}")
	public String noticeEdit(@PathVariable(name = "notice_no") int notice_no, 
			@ModelAttribute(name="notice") Notice notice) {
		
		try {
			noticeRepositoty.updateByNotice(notice_no, notice);
		} catch (Exception e) { }
		
		
		return "redirect:/admin/noticeList/{notice_no}";
	}
	
	// [공지사항 등록 페이지]
	@GetMapping("/add")
	public String noticeAddForm(Model model) {
		
		return "admin/notice/noticeAdd";
	}
	
	// [공지사항 등록]
	@PostMapping("/add") 
	public String noticeAdd(@ModelAttribute(name = "notice") Notice notice) {
		
		noticeRepositoty.save(notice);
		int noticeId = notice.getNotice_no();
		// log.info("notice.getNotice_no() > " + notice.getNotice_no());
		
		return "redirect:/admin/noticeList/" + noticeId;
	}
	
	// [공지사항 삭제]
	@GetMapping("/delete/{notice_no}")
	public String noticeDelte(@PathVariable String notice_no) {
		
		try {
			noticeRepositoty.deleteByNotice(notice_no);
		} catch (Exception e) { }
		
		return "redirect:/admin/noticeList/";
	}
}
