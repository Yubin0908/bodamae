package himedia.project.bodamae.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import himedia.project.bodamae.dto.Company;
import himedia.project.bodamae.dto.CompanyImage;
import himedia.project.bodamae.repository.CompanyImageRepository;
import himedia.project.bodamae.repository.CompanyRepository;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/")
public class IndexController {
	
	private final CompanyRepository companyRepository;
	private final CompanyImageRepository imgRepository;
	
	@Autowired
	public IndexController(CompanyRepository companyRepository, CompanyImageRepository imgRepository) {
		this.companyRepository = companyRepository;
		this.imgRepository = imgRepository;
	}
	
	@GetMapping("")
	public String index(Model model) {
		log.info("zz인덱스");
		
		// 반려동물 동반
		List<Company> companyList = companyRepository.companyIndexList();
		List<CompanyImage> companyUrlList = imgRepository.companyIndexUrlList();
		log.info("장소 : {}",companyList);
		model.addAttribute("companyList", companyList);
		model.addAttribute("companyUrlList", companyUrlList);
		return "index";
	}
}
