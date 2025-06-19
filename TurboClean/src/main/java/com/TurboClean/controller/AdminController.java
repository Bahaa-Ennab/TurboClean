package com.TurboClean.controller;

import java.util.List;

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
import com.TurboClean.services.CustomerService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class AdminController {
	@Autowired
	AdminServices adminService;
	
	@Autowired
	CustomerService customerService;
	
	
	
	 @GetMapping("/admin/login")
	    public String showAdminLogin(Model model) {
	        model.addAttribute("adminLogin", new LoginAdmin()); 
	        model.addAttribute("newAdmin", new Admin());  
	        return "Adminlogin.jsp";                            
	    }
	    
		@PostMapping("/admin/login")
		public String login(@Valid @ModelAttribute("adminLogin") LoginAdmin newLogin, BindingResult result, Model model,
				HttpSession session) {
			Admin admin = adminService.login(newLogin, result);
			if (result.hasErrors()) {
				model.addAttribute("adminLogin", new Admin());
				return "index.jsp";
			}
			session.setAttribute("loggedAdmin", admin);
			return "redirect:/admin/dashboard";
		}
		
		
		
		
		

	    /* ========== 2) صفحة التسجيل ========== */

	    @GetMapping("/register/admin")
	    public String showAdminRegister(Model model) {
	        model.addAttribute("adminSignup", new Admin());

	        return "adminRegister.jsp";                          // /WEB-INF/admin/register.jsp
	    }

	    @PostMapping("/admin/register")
	    public String processAdminRegister(
	    		 @Valid @ModelAttribute("adminSignup") Admin admin,
	    	        BindingResult result,
	    	        HttpSession session) {
			Admin signedUpAdmin = adminService.register(admin, result);

	        if (result.hasErrors()) {

	            return "adminRegister.jsp";
	        }
	        
	        session.setAttribute("loggedAdmin", admin);
	        return "redirect:/admin/dashboard";

	    }

	    /* ========== 3) لوحة التحكم ========== */
	    
		 @GetMapping("/admin/dashboard")

		    public String showAdmindashboard(Model model) {
		        return "adminDashboard.jsp";                             // /WEB-INF/admin/login.jsp
		    }
		 
		 @GetMapping("/admin/customers")
		    public String showCustomers(Model model) {
			 	List<Customer> customers=customerService.allCustomers();
			 	model.addAttribute("customers", customers);
		        return "allCustomer.jsp";                             
		    }
		 
		 
		 
}
