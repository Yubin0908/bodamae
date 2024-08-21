package himedia.project.bodamae.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {


    @GetMapping("/admin/adminList")
    public String adminList() {
        
        return "admin/management/admin-list";
    }

    @GetMapping("/admin/adminManagement")
    public String adminManagement() {
        return "admin/management/admin-management";
    }
}
