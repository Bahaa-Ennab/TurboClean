package com.TurboClean.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.TurboClean.models.Order;
import com.TurboClean.models.OrderRequestDTO;
import com.TurboClean.repositories.MessageRepository;
import com.TurboClean.services.CustomerService;
import com.TurboClean.services.MessageService;
import com.TurboClean.services.OrderService;

@RestController
@RequestMapping("/admin")
public class AdminOrderController {

    private final OrderService orderService;

    @Autowired
    MessageRepository messageRepository;
    
    @Autowired
    MessageService messageService;
    public AdminOrderController(OrderService orderService) {
        this.orderService = orderService;
    }
    
	@Autowired
	CustomerService customerService;

	@PostMapping("/orders")
	public ResponseEntity<?> createOrder(
	        @RequestParam(value = "messageId", required = false) Long messageId,
	        @RequestBody OrderRequestDTO orderRequest) {
	    System.out.println("Received messageId: " + messageId);

	    try {
	        Order createdOrder = orderService.createOrder(
	            1L,  // admin id, to be replaced properly
	            orderRequest.getCustomerId(),
	            orderRequest.getAddress(),
	            orderRequest.getItems()
	        );

	        if (messageId != null) {
	            System.out.println("Deleting message with id: " + messageId);  // <--- Add this

	            messageService.deleteById(messageId);
	        }

	        return ResponseEntity.ok(createdOrder);

	    } catch (Exception e) {
	        return ResponseEntity.badRequest().body("Failed to create order: " + e.getMessage());
	    }
	}

    

    
}