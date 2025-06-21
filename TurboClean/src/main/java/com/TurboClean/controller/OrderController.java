package com.TurboClean.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	

	@PostMapping("/inprogress/{id}")
	public String moveToInprogress(@PathVariable Long id, Model model, HttpSession session) {
		Order ord =orderService.findOrder(id);
		ord.setStatus(statusService.findByStatuscondition("In Progress"));
		orderService.saveOrder(ord);
		return "redirect:/admin/orders/waiting";	}
	
	@PostMapping("/finished/{id}")
	public String moveToFinished(@PathVariable Long id, Model model, HttpSession session) {
		Order ord =orderService.findOrder(id);
		ord.setStatus(statusService.findByStatuscondition("Finished"));
		orderService.saveOrder(ord);
		return "redirect:/admin/orders/inprogress";	}

	@PostMapping("/paid/{id}")
	public String moveTopaid(@PathVariable Long id, Model model, HttpSession session) {
		Order ord =orderService.findOrder(id);
		ord.setStatus(statusService.findByStatuscondition("Paid"));
		orderService.saveOrder(ord);
		return "redirect:/admin/orders/finished";	}

	
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
	
	@GetMapping("/orders/{id}")
	public String showOrderDetails(@PathVariable Long id, Model model, HttpSession session) {
		Order order =orderService.findOrder(id);
		model.addAttribute("order", order);
		return "orderDetails.jsp";	}
	
	@GetMapping("/order/edit_display/{id}")
	public String displayEditOrder(@PathVariable Long id, Model model, HttpSession session) {
		Order order =orderService.findOrder(id);
		model.addAttribute("order", order);
		return "orderDetails.jsp";	}
	
	
	@GetMapping("/orders/search")
	@ResponseBody
	public List<Order> searchOrdersByCustomerName(@RequestParam("keyword") String keyword) {
	    return orderService.findOrdersByCustomerName(keyword); // customize this to your service
	}
}
