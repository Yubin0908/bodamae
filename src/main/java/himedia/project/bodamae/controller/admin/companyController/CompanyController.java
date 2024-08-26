package himedia.project.bodamae.controller.admin.companyController;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import himedia.project.bodamae.dto.Company;
import himedia.project.bodamae.repository.CompanyRepository;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("admin/company")
public class CompanyController {

	private final CompanyRepository repository;

	@Autowired
	public CompanyController(CompanyRepository repository) {
		this.repository = repository;
	}

	// 업체관리 페이지 ==================================
	@GetMapping("/companyList")
	public String companyList(Model model) {

		List<Company> companyList = repository.companyList();
		model.addAttribute("companyList", companyList);

		return "admin/company/companyList";
	}

	// 업체 검색 ========================================
	@GetMapping("/search")
	public String search(Model model, @RequestParam(value = "column") String column,
			@RequestParam(value = "search") String search) {

		// 검색을 아무것도 적지 않았을 때는 전체리스트를 조회할 수 있도록 함
		if (column.equals("선택") && search == "") {
			List<Company> companyList = repository.companyList();
			model.addAttribute("companyList", companyList);
			log.info("아무 것도 입력하지 않았을 때 실행" + companyList);
			return "admin/company/companyList";
		// 선택에 두고 검색했을 경우 모든 컬럼에 해당 데이터가 있는지 확인
		} else if (column.equals("선택")) {
			List<Company> findByChoose = repository.findByChoose(search);
			model.addAttribute("companyList", findByChoose);
			return "admin/company/companyList";
		}
		
		// 검색 ====================================================
		List<Company> companyList = repository.findByColumn(column, search);
		model.addAttribute("companyList", companyList);
		return "admin/company/companyList";
	}

	// 업체 신규 등록 페이지 =============================
	@GetMapping("/companyAdd")
	public String companyAdd() {
		return "admin/company/companyAdd";
	}
	
	// 업체 상세 페이지 ==================================
	@GetMapping("/companyDetail/{cmp_code}") 
	public String companyDetail() { 
		return "admin/company/companyDetail";
	}

	// 업체 수정 페이지
	@GetMapping("/companyEdit")
	public String companyEdit() {
		return "admin/company/companyEdit";
	}

}
