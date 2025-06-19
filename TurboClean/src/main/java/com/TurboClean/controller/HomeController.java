package com.TurboClean.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.jaxb.SpringDataJaxb.OrderDto;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.TurboClean.models.Order;
import com.TurboClean.services.OrderService;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

	@GetMapping("/")
	public String Home(Model model) {
		return "index.jsp";
	}
	
	 @GetMapping("/logout")
	    public String logout(HttpSession session) {
	        session.invalidate();
	        return "redirect:/";
	    }
	 
}
