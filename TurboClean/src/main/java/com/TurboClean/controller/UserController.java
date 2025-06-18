//package com.TurboClean.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//
//import com.TurboClean.models.LoginUser;
//import com.TurboClean.models.User;
//import com.TurboClean.services.UserService;
//
//import jakarta.servlet.http.HttpSession;
//import jakarta.validation.Valid;
//
//
//@Controller
//public class UserController {
//
//	@Autowired
//	UserService userSerivce;
//	
//	@GetMapping("/login")
//	public String index(Model model) {
//
//		// Bind empty User and LoginUser objects to the JSP
//		// to capture the form input
//		model.addAttribute("newUser", new User());
//		model.addAttribute("newLogin", new LoginUser());
//		return "login.jsp";
//	}
//	
//	
//	@PostMapping("/userlogin")
//	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model,
//			HttpSession session) {
//		 User user = userSerivce.Login(newLogin, result);
//		if (result.hasErrors()) {
//			model.addAttribute("newUser", new User());
//			return "index.jsp";
//		}
//		session.setAttribute("loggedUser", user);
//		return "redirect:/home";
//	}
//	
//	@GetMapping("/register")
//	public String register(Model model) {
//		model.addAttribute("newUser", new User());
//		model.addAttribute("newLogin", new LoginUser());
//		return "register.jsp";
//	}
//	
//	@PostMapping("/register")
//	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model,
//			HttpSession session) {
//		User signedUpUser = userSerivce.register( newUser , result);
//		if (result.hasErrors()) {
//			model.addAttribute("newLogin", new LoginUser());
//			return "index.jsp";
//		}
//		session.setAttribute("loggedUser", signedUpUser);
//		return "redirect:/home";
//	}
//	
//}
//
