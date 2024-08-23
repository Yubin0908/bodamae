package himedia.project.bodamae.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
}
