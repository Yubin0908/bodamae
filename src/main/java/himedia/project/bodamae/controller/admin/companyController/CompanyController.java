package himedia.project.bodamae.controller.admin.companyController;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin/company")
public class CompanyController {
	
	/*
	 * private final CompanyRepository repository;
	 * 
	 * @Autowired public CompanyController(CompanyRepository repository) {
	 * this.repository = repository; }
	 */
	@GetMapping("/companyList")
	public String companyList(Model model) {
		/*
		 * List<Company> companyList = repository.companyList();
		 * model.addAttribute("company", companyList);
		 */
		return "admin/company/companyList";
	}
	
	@GetMapping("/companyAdd")
	public String companyAdd() {
		return "admin/company/companyAdd";
	}
	
	@GetMapping("/companyEdit")
	public String companyEdit() {
		return "admin/company/companyEdit";
	}
	
}
