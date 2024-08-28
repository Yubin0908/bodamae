package himedia.project.bodamae.controller.admin;

import himedia.project.bodamae.dto.Admin;
import himedia.project.bodamae.dto.User;
import himedia.project.bodamae.repository.AdminRepository;
import himedia.project.bodamae.service.Pagination;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Slf4j
@Controller
public class AdminController {

    private final AdminRepository adminRepository;

    @Autowired
    public AdminController(AdminRepository adminRepository) {
        this.adminRepository = adminRepository;
    }

    @GetMapping("/admin/login")
    public String login() {
        return "admin/adminLogin";
    }

    @PostMapping("/admin/login")
    public String login(HttpSession session, RedirectAttributes redirect, String user_id, String user_password) {
        User admin = adminRepository.findUserById(user_id);
        if (admin != null && admin.getUser_password().equals(user_password) && admin.getAdmin_check() == 1) {
            session.setAttribute("admin", admin);
        } else {
            redirect.addAttribute("loginFailMsg", "아이디 또는 비밀번호가 일치하지 않습니다.");
        }

        return "redirect:/admin/userList";
    }

    @GetMapping("/admin/adminList")
    public String adminList(Model model, String option, String keyword, String page) {
        int limit = 10;
        int offSet = 0;
        if (page != null && Integer.parseInt(page) != 1) {
            offSet = (Integer.parseInt(page) - 1) * limit;
        }

        model.addAttribute("paging", new Pagination(adminRepository.adminCount(), page, limit, 10));

        log.info(model.toString());

        if (keyword != null && !keyword.isEmpty()) {
            model.addAttribute("admins", adminRepository.searchAdmin(option, keyword));
        } else {
            model.addAttribute("admins", adminRepository.findAll(limit, offSet));
        }
        return "admin/management/admin-list";
    }

    @GetMapping("/admin/adminManagement")
    public String adminManagement(Model model, String option, String keyword, String admin, String page) {
        int limit = 10;
        int offSet = 0;
        if (page != null && Integer.parseInt(page) != 1) {
            offSet = (Integer.parseInt(page) - 1) * limit;
        }

        model.addAttribute("paging", new Pagination(adminRepository.userCount(), page, limit, 10));

        if (keyword != null && !keyword.isEmpty()) {
            if (admin != null && admin.equals("y")) {
                model.addAttribute("admins", adminRepository.searchAdmin(option, keyword));
                model.addAttribute("users", adminRepository.findAllUser(9999, 0));
            } else {
                model.addAttribute("users", adminRepository.searchUser(option, keyword));
                model.addAttribute("admins", adminRepository.findAll(9999, 0));
            }
        } else {
            model.addAttribute("admins", adminRepository.findAll(9999, 0));
            model.addAttribute("users", adminRepository.findAllUser(9999, 0));
        }
        return "admin/management/admin-management";
    }

    @GetMapping("/admin/updateUser/{user_id}")
    public String updateUser(@PathVariable("user_id") String user_id, Model model) {
        adminRepository.createAdminNo();
        int new_admin_id = adminRepository.findNewAdminNo();
        log.info("new admin_id: " + new_admin_id);
        boolean result = adminRepository.changeUserToAdmin(user_id, new_admin_id);

        if (result) {
            model.addAttribute("users", adminRepository.findAllUser(9999, 0));
        } else {
            model.addAttribute("failMsg", "["+user_id+"]알 수 없는 오류로 수정작업이 실패되었습니다.");
        }

        return "redirect:/admin/adminManagement";
    }

    @GetMapping("/admin/updateAdmin/{user_id}")
    public String updateAdmin(@PathVariable("user_id") String user_id, Model model, String page) {
        User user = adminRepository.findUserById(user_id);
        boolean result = adminRepository.changeAdminToUser(user_id);
        boolean admin_delete = adminRepository.deleteAdmin(user.getAdmin_no());

        int limit = 10;
        int offSet = 0;
        if (page != null && Integer.parseInt(page) != 1) {
            offSet = (Integer.parseInt(page) - 1) * limit;
        }
        model.addAttribute("paging", new Pagination(adminRepository.userCount(), page, limit, 10));

        if (result) {
            model.addAttribute("users", adminRepository.findAll(limit, offSet));
        } else {
            model.addAttribute("failMsg", "["+user_id+"]알 수 없는 오류로 수정작업이 실패되었습니다.");
        }

        return "redirect:/admin/adminManagement";
    }

    @GetMapping("/admin/userList")
    public String userList(Model model, String option, String keyword, String page) {
        int limit = 10;
        int offSet = 0;
        if (page != null && Integer.parseInt(page) != 1) {
            offSet = (Integer.parseInt(page) - 1) * limit;
        }
        model.addAttribute("paging", new Pagination(adminRepository.userCount(), page, limit, 10));

        if (keyword != null && !keyword.isEmpty()) {
            model.addAttribute("users", adminRepository.searchUser(option, keyword));
        } else {
            model.addAttribute("users", adminRepository.findAllUsers(limit, offSet));
        }
        return "admin/management/user-list";
    }

    @GetMapping("/admin/userManagement")
    public String userManagement(String user_id, Model model) {
        model.addAttribute("user", adminRepository.findUserById(user_id));
        return "admin/management/user-management";
    }

    @GetMapping("/admin/userDrop/{user_id}")
    public String userDrop(@PathVariable String user_id, Model model) {
        try {
            adminRepository.deleteAllPetByUserId(user_id);
            adminRepository.deleteAllFreeBoardByUserId(user_id);
            adminRepository.deleteByUserId(user_id);
        } catch (DropUserException e) {
            model.addAttribute("failMsg", new DropUserException(e.getMessage()));
        }

        return "redirect:/admin/userList";
    }

    @GetMapping("/admin/logout")
    public String adminLogout(HttpSession session) {
        session.invalidate();
        return "redirect:/admin/login";
    }

}

class DropUserException extends RuntimeException {
    DropUserException() {}
    DropUserException(String message) { super("해당 유저는 삭제가 불가능합니다. 관리자에게 문의하세요."); }
}
