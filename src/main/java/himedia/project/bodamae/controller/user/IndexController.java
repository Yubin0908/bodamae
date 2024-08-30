package himedia.project.bodamae.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import himedia.project.bodamae.dto.Company;
import himedia.project.bodamae.dto.CompanyImage;
import himedia.project.bodamae.dto.Pet;
import himedia.project.bodamae.repository.CompanyImageRepository;
import himedia.project.bodamae.repository.CompanyRepository;
import himedia.project.bodamae.repository.PetRepository;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/")
public class IndexController {
	
	private final CompanyRepository companyRepository;
	private final CompanyImageRepository imgRepository;
	private final PetRepository petRepository;
	
	@Autowired
	public IndexController(CompanyRepository companyRepository, CompanyImageRepository imgRepository, PetRepository petRepository) {
		this.companyRepository = companyRepository;
		this.imgRepository = imgRepository;
		this.petRepository = petRepository;
	}
	
	@GetMapping("")
	public String index(Model model) {
		
		// 반려동물
		List<Pet> petList = petRepository.petIndexlList();
		
		// 장소
		List<Company> companyList = companyRepository.companyIndexList();
		List<CompanyImage> companyUrlList = imgRepository.companyIndexUrlList();
		
		model.addAttribute("petList", petList);
		model.addAttribute("companyList", companyList);
		model.addAttribute("companyUrlList", companyUrlList);
		return "index";
	}
	
	@GetMapping("/search")
	public String placeSearch(@RequestParam(value = "place") String place, Model model) {
		List<Company> placeList = companyRepository.findByPlace("%" + place + "%");
		model.addAttribute("placeList", placeList);
		
		return "user/place/placeList";
	}
	
	@GetMapping("error-404")
	public String error404() {
		return "error";
	}
}
