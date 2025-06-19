package com.TurboClean.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.TurboClean.models.Customer;
import com.TurboClean.models.LoginCustomer;
import com.TurboClean.models.Message;
import com.TurboClean.models.Order;
import com.TurboClean.services.CustomerService;
import com.TurboClean.services.MessageService;
import com.TurboClean.services.OrderService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class CustomerController {

	@Autowired
	CustomerService customerSerivce;
	
	@Autowired
	MessageService messageService;

	@Autowired
	OrderService orderService;
	
	@GetMapping("/login")
	public String index(Model model) {
		model.addAttribute("newCustomer", new Customer());
		model.addAttribute("newLogin", new LoginCustomer());
		return "login.jsp";
	}

	@PostMapping("/customerlogin")
	public String login(@Valid @ModelAttribute("newCustomer") LoginCustomer newLogin, BindingResult result, Model model,
			HttpSession session) {
		Customer customer = customerSerivce.Login(newLogin, result);
		if (result.hasErrors()) {
			model.addAttribute("newCustomer", new Customer());
			return "index.jsp";
		}
		session.setAttribute("loggedCustomer", customer);
		return "redirect:/customer/home";
	}

	@GetMapping("/register")
	public String register(Model model) {
		model.addAttribute("newCustomer", new Customer());
		model.addAttribute("newLogin", new LoginCustomer());
		return "register.jsp";
	}

	@PostMapping("/customerregister")
	public String register(@Valid @ModelAttribute("newCustomer") Customer newCustomer, BindingResult result, Model model,
			HttpSession session) {
		Customer signedUpCustomer = customerSerivce.register(newCustomer, result);
		if (result.hasErrors()) {
			model.addAttribute("newCustomer", new LoginCustomer());
			return "index.jsp";
		}
		session.setAttribute("loggedCustomer", signedUpCustomer);
		return "redirect:/customer/home";
	}
	//-------------------------------------------------------------------------------------------------------
	
	@GetMapping("/customer/home")
	public String customer(Model model,HttpSession session) {
		model.addAttribute("customerMessage", new Message());
//		Customer custom=(Customer) session.getAttribute("loggedCustomer");
		return "customer.jsp";
}
	@PostMapping("/customer/sendMessage")
	public String sendMessage(@Valid @ModelAttribute("customerMessage") Message customerMessage, BindingResult result, Model model,
			HttpSession session) {
		
		if (result.hasErrors()) {
			return "customer.jsp";
		}
		Customer custom=(Customer) session.getAttribute("loggedCustomer");
		customerMessage.setCustomer(custom);
		messageService.createMessage(customerMessage);
		return "redirect:/customer/messages";
	}
	
	@GetMapping("/customer/messages")
	public String customerMessages() {
		return "customerMessages.jsp";
	
	}
	
	//-------------------------------------------------------------------------------------------------------

	@GetMapping("/customer/orders")
	public String customerOrders(Model model,HttpSession session) {
		Customer custom=(Customer) session.getAttribute("signedUpCustomer");
		List<Order> orders= orderService.findAllByCustomer(custom);
		model.addAttribute("orders",orders);
		
		return "customerOrder.jsp";
	
	}
	
}