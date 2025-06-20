package com.TurboClean.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.TurboClean.models.Admin;
import com.TurboClean.models.Order;
import com.TurboClean.models.Status;
import com.TurboClean.services.OrderService;
import com.TurboClean.services.StatusService;

import jakarta.servlet.http.HttpSession;

@Controller
public class OrderController {

	@Autowired
	OrderService orderService;
	
	@Autowired
	StatusService statusService;

	@GetMapping("/orders/all")
	public String allOrders(Model model, HttpSession session) {
		List<Order> orders = orderService.allOrders();
		model.addAttribute("orders", orders);
		return "AllOrdersForAdmin.jsp";

	}
	
	@GetMapping("/admin/orders/waiting")
	public String waiting(Model model, HttpSession session) {
		Status status = statusService.findStatus(1L);
		List<Order> orders = orderService.findAllByStatus(status);
		model.addAttribute("orders", orders);
		return "waiting.jsp";

	}
	
	@GetMapping("/admin/orders/inprogress")
	public String inProgress(Model model, HttpSession session) {
		Status status = statusService.findStatus(2L);
		List<Order> orders = orderService.findAllByStatus(status);
		model.addAttribute("orders", orders);
		return "inProgress.jsp";

	}
	
	@GetMapping("/admin/orders/finished")
	public String finished(Model model, HttpSession session) {
		Status status = statusService.findStatus(3L);
		List<Order> orders = orderService.findAllByStatus(status);
		model.addAttribute("orders", orders);
		return "finished.jsp";

	}
	
	@GetMapping("/admin/orders/paid")
	public String paid(Model model, HttpSession session) {
		Status status = statusService.findStatus(4L);
		List<Order> orders = orderService.findAllByStatus(status);
		model.addAttribute("orders", orders);
		return "paid.jsp";

	}
}
