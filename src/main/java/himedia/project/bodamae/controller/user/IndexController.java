package himedia.project.bodamae.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import himedia.project.bodamae.dto.Company;
import himedia.project.bodamae.repository.CompanyRepository;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/")
public class IndexController {
	
	private final CompanyRepository companyRepository;
	// private final CompanyRepository companyRepository;
	
	@Autowired
	public IndexController(CompanyRepository companyRepository) {
		this.companyRepository = companyRepository;
	}
	
	@GetMapping("")
	public String index(Model model) {
		log.info("zz인덱스");
		
		// 반려동물 동반
		List<Company> companyList = companyRepository.companyIndexList();
		log.info("장소 : {}",companyList);
		model.addAttribute("companyList", companyList);
		return "index";
	}
}
