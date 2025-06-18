package com.TurboClean.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.TurboClean.models.Customer;
import com.TurboClean.models.LoginCustomer;
import com.TurboClean.services.CustomerService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class CustomerController {

	@Autowired
	CustomerService customerSerivce;

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
		return "redirect:/customer";
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
		return "redirect:/customer";
	}
	
	@GetMapping("/customer")
	public String customer() {
		return "customer.jsp";
}
}