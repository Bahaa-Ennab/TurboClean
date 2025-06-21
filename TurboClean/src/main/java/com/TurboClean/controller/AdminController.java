package com.TurboClean.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.TurboClean.models.Admin;
import com.TurboClean.models.Customer;
import com.TurboClean.models.LoginAdmin;
import com.TurboClean.models.Message;
import com.TurboClean.repositories.ItemRepository;
import com.TurboClean.services.AdminServices;
import com.TurboClean.services.CustomerService;
import com.TurboClean.services.MessageService;
import com.TurboClean.services.OrderService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class AdminController {
	@Autowired
	AdminServices adminService;
	
	@Autowired
	ItemRepository itemRepository;
	
	@Autowired
	CustomerService customerService;
	
	@Autowired
	MessageService messageService;
	
	@Autowired
	OrderService orderService;
	
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
		        model.addAttribute("items", itemRepository.findAll());
		        
		        return "adminDashboard.jsp";      
		        }
//-------------------------------------------------------------------------------------------------------------		 
		 @GetMapping("/admin/neworder/{id}")
		    public String newOrder(@PathVariable Long id,Model model) {
		        model.addAttribute("items", itemRepository.findAll());
		        model.addAttribute("customerId", id);
		        Customer customer =customerService.getUserById(id);
		        model.addAttribute("customer", customer);

		        return "NewOrder.jsp";      
		        }
		 
//	------------------------------------------------------------------------------------------------------------	 
		 
		 @GetMapping("/admin/customers")
		    public String showCustomers(Model model) {
			 	List<Customer> customers=customerService.allCustomers();
			 	model.addAttribute("customers", customers);
		        return "allCustomer.jsp";                             
		    }
		 		 
		 @GetMapping("/admin/messages")
		    public String showMessages(Model model) {
			 	List<Message> messages=messageService.allMessages();
			 	model.addAttribute("messages", messages);
		        return "adminMessages.jsp";                             
		    }
		 @GetMapping("/admin/search")
		    public String searchCustomers(@RequestParam("keyword") String keyword, Model model) {
		        List<Customer> customers = customerService.searchCustomers(keyword);
		        model.addAttribute("customers", customers);
		        // ترجع صفحة JSP جزئية ترجع فقط <tr> عناصر بدون الهيكل الكامل
		        return "fragments/customerRows"; 
		    }
		 
		 @GetMapping("/admin/user-details")
		 public String userDetails(@RequestParam("keyword") String keyword, Model model) {
		     List<Customer> customers = customerService.searchCustomers(keyword);

		     if (customers.isEmpty()) {
		         return "redirect:/admin/customers?notFound";
		     }

		     Customer customer = customers.get(0);
		     model.addAttribute("customer", customer);
		     model.addAttribute("editCustomer", customer);
		     return "userDetails.jsp"; // ✅ المسار الصحيح
		 }
		 @PostMapping("/admin/customers/update")
		 public String updateCustomer(@ModelAttribute("editCustomer") Customer customer) {
		     customerService.updateCustomer(customer);
		     return "redirect:/admin/user-details?keyword=" + customer.getId();  // ✅ يرجع للتفاصيل بعد الحفظ
		 }
		 
}
