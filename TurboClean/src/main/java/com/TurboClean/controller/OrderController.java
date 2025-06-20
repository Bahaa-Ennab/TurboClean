package com.TurboClean.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.TurboClean.models.Admin;
import com.TurboClean.models.Order;
import com.TurboClean.services.OrderService;
import com.TurboClean.services.StatusService;

import ch.qos.logback.core.status.Status;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/orders")
public class OrderController {

	@Autowired
	OrderService orderService;
	@Autowired
	StatusService statusService;

	@GetMapping("/all")
	public String allOrders(Model model, HttpSession session) {
		Admin admin = (Admin) session.getAttribute("loggedAdmin");
		List<Order> orders = orderService.allOrders();
		Order ord =orderService.findOrder(1L);
		model.addAttribute("orders", orders);
		return "AllOrdersForAdmin.jsp";

	}
	
	
	@PostMapping("/inprogress/{id}")
	public String moveToInprogress(@PathVariable Long id, Model model, HttpSession session) {
		Order ord =orderService.findOrder(id);
		ord.setStatus(statusService.findByStatuscondition("In Progress"));
		orderService.saveOrder(ord);
		return "redirect:/orders/all";	}
}
