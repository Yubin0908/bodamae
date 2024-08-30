package himedia.project.bodamae.controller.admin.companyController;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import himedia.project.bodamae.dto.Company;
import himedia.project.bodamae.dto.CompanyImage;
import himedia.project.bodamae.repository.CompanyImageRepository;
import himedia.project.bodamae.repository.CompanyRepository;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("admin/company")
public class CompanyController {

	private final CompanyRepository companyRepository;
	private final CompanyImageRepository imgRepository;

	public CompanyController(CompanyRepository companyRepository, CompanyImageRepository imgRepository) {
		this.companyRepository = companyRepository;
		this.imgRepository = imgRepository;
	}

	// 업체관리 페이지 ==================================
	@GetMapping("/companyList")
	public String companyList(Model model) {

		// 업체리스트를 불러오기 위한 companyList()메소드 실행
		List<Company> companyList = companyRepository.companyList();
		model.addAttribute("companyList", companyList);

		return "admin/company/companyList";
	}

	// 업체 검색 ========================================
	@GetMapping("/search")
	public String search(Model model, @RequestParam(value = "column") String column,
			@RequestParam(value = "search") String search) {

		// 검색을 아무것도 적지 않았을 때는 전체리스트를 조회
		if (column.equals("선택") && search == "") {
			List<Company> companyList = companyRepository.companyList();
			model.addAttribute("companyList", companyList);
			return "admin/company/companyList";
		// 선택에 두고 검색했을 경우 모든 컬럼에 해당 데이터가 있는지 조건확인
		} else if (column.equals("선택")) {
			List<Company> findByChoose = companyRepository.findByChoose(search);
			model.addAttribute("companyList", findByChoose);
			return "admin/company/companyList";
		}
		
		// 검색
		List<Company> companyList = companyRepository.findByColumn(column, search);
		model.addAttribute("companyList", companyList);
		return "admin/company/companyList";
	}

	// 업체 신규 등록 페이지 =============================
	@GetMapping("/companyAdd")
	public String companyAdd() {
		return "admin/company/companyAdd";
	}
	
	// 신규 등록 후 페이지 ===============================
	@PostMapping("/companyList")
	public String add(@ModelAttribute("company") Company company, @RequestParam("cmp_img_url") String cmp_img_url) {

    CompanyImage companyImage = new CompanyImage(cmp_img_url);
    // 이미지 저장
    int result = imgRepository.saveImg(companyImage);
    // 저장된 이미지의 번호가져와서 객체와 함께 전달
    company.setCmp_img_no(companyImage.getCmp_img_no());
    companyRepository.saveCompany(company);

    return "redirect:companyList";
	}
	
	// 업체 상세 페이지 ==================================
  @GetMapping("/companyDetail/{cmp_code}")
  public String companyDetail(@PathVariable int cmp_code, Model model) { 
  	
  	model.addAttribute("cmp", companyRepository.findByCode(cmp_code).get());
  	
  	return "admin/company/companyDetail"; 
  }

	// 업체 수정 페이지 ==================================
	@GetMapping("/companyEdit/{cmp_code}")
	public String companyEdit(@PathVariable int cmp_code, Model model) {
		
		model.addAttribute("cmp", companyRepository.findByCode(cmp_code).get());
		
		return "admin/company/companyEdit";
	}
	
	// 업체 수정 후 상세보기 페이지로 이동 ==============
	@PostMapping("/companyDetail/{cmp_code}")
	public String edit(@PathVariable int cmp_code, @ModelAttribute("company") Company company) {
		
		companyRepository.update(cmp_code, company);
		
		return "redirect:{cmp_code}";
	}
	
	// 업체 삭제 후 전체리스트 이동 =====================
	@GetMapping("/delete/{cmp_code}")
	public String companyDelete(@PathVariable int cmp_code) {

	    companyRepository.deleteCompany(cmp_code);

	    // 업체관리 페이지에서 시작하는 절대 경로로 리다이렉트
	    return "redirect:/admin/company/companyList";
	}
}
