package com.TurboClean.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.TurboClean.models.Admin;
import com.TurboClean.models.Customer;
import com.TurboClean.models.LoginAdmin;
import com.TurboClean.services.AdminServices;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class AdminController {
	@Autowired
	AdminServices adminService;
	
	
	 @GetMapping("/admin/login")
	    public String showAdminLogin(Model model) {
	        model.addAttribute("adminLogin", new LoginAdmin());   // modelAttribute واحد فقط
	        return "admin/login.jsp";                             // /WEB-INF/admin/login.jsp
	    }

	    @PostMapping("/admin/login")
	    public String processAdminLogin(
	            @Valid @ModelAttribute("adminLogin") LoginAdmin adminLogin,
	            BindingResult result,
	            HttpSession session,
	            Model model) {

	        Admin admin = adminService.login(adminLogin, result);

	        if (result.hasErrors()) {
	            // أعِد نفس الكائن ليَظهر مع رسائل الخطأ
	            return "admin/login.jsp";
	        }

	        session.setAttribute("loggedAdmin", admin);
	        return "redirect:/admin/dashboard";                   // عدِّل المسار كما تريد
	    }

	    /* ========== 2) صفحة التسجيل ========== */

	    @GetMapping("/register/admin")
	    public String showAdminRegister(Model model) {
	        model.addAttribute("adminSignup", new Admin());
	        System.out.println("alooooooooooo");
	        return "adminRegister.jsp";                          // /WEB-INF/admin/register.jsp
	    }

	    @PostMapping("/admin/register")
	    public String processAdminRegister(
	    		 @Valid @ModelAttribute("adminSignup") Admin admin,
	    	        BindingResult result,
	    	        HttpSession session) {
			Admin signedUpAdmin = adminService.register(admin, result);

	        if (result.hasErrors()) {
		        System.out.println("meeeeeeeeeeeeen");

	            return "adminRegister.jsp";
	        }
	        
	        session.setAttribute("loggedAdmin", admin);
	        return "redirect:/adminDashboard";
	    }

	    /* ========== 3) لوحة التحكم ========== */
	    
		 @GetMapping("/adminDashboard")
		    public String showAdmindashboard(Model model) {
		        return "adminDashboard.jsp";                             // /WEB-INF/admin/login.jsp
		    }
}
