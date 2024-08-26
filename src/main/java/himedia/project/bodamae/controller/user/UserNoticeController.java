package himedia.project.bodamae.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import himedia.project.bodamae.dto.Notice;
import himedia.project.bodamae.repository.NoticeRepositoty;

@Controller
@RequestMapping("notice")
public class UserNoticeController {
	
	private final NoticeRepositoty noticeRepositoty;
	
	@Autowired
	public UserNoticeController(NoticeRepositoty noticeRepositoty) {
		this.noticeRepositoty = noticeRepositoty;
	}
	
	@GetMapping("")
	public String noticeList(Model model) {
		
		try {
			List<Notice> noticeList = noticeRepositoty.noticeList();
			model.addAttribute("noticeList", noticeList);
		} catch (Exception e) { }
		
		return "user/notice/noticeList";
	}
	
	@GetMapping("/{notice_no}")
	public String noticeDetail(@PathVariable("notice_no") int notice_no, Model model) {
		
		try {
			Notice notice = noticeRepositoty.findById(notice_no).get();
			model.addAttribute("notice", notice);
		} catch (Exception e) { }
		
		return "user/notice/noticeDetail";
	}
	
}
