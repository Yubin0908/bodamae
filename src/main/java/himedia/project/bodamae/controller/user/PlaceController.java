package himedia.project.bodamae.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import himedia.project.bodamae.dto.Company;
import himedia.project.bodamae.repository.CompanyRepository;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("place")
public class PlaceController {

	private final CompanyRepository companyRepository;

	@Autowired
	public PlaceController(CompanyRepository companyRepository) {
		this.companyRepository = companyRepository;
	}
	// 장소 페이지
	@GetMapping("")
	public String placeList(Model model) {
		
			List<Company> placeList = companyRepository.placeList();
			model.addAttribute("placeList", placeList);
		
		return "user/place/placeList";
	}
	
	// 장소 검색
	@GetMapping("/search")
	public String search(Model model, @RequestParam(value = "column") String column,
			@RequestParam(value = "search") String search) {

		// 검색을 아무것도 적지 않았을 때는 전체리스트를 조회
		if (column.equals("선택") && search == "") {
			List<Company> companyList = companyRepository.placeList();
			model.addAttribute("companyList", companyList);
			return "admin/company/companyList";
		// 선택에 두고 검색했을 경우 모든 컬럼에 해당 데이터가 있는지 조건확인
		} else if (column.equals("선택")) {
			List<Company> findByChoose = companyRepository.findByChoosePlace(search);
			model.addAttribute("companyList", findByChoose);
			return "redirect:user/place/placeList";
		}
		
		// 검색
		List<Company> companyList = companyRepository.findByColumnPlace(column, search);
		model.addAttribute("companyList", companyList);
		return "user/place/placeList";
	}
	
	// 장소 상세 페이지
	@GetMapping("{cmp_name}")
	public String placeDetail(@PathVariable String cmp_name, Model model) {
		
		model.addAttribute("place", companyRepository.findByName(cmp_name).get());
		
		return "user/place/placeDetail";
	}
	
	
}
