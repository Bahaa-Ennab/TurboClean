package com.TurboClean.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.TurboClean.models.Customer;
import com.TurboClean.models.Order;
import com.TurboClean.models.OrderRequestDTO;
import com.TurboClean.services.CustomerService;
import com.TurboClean.services.OrderService;

@RestController
@RequestMapping("/admin")
public class AdminOrderController {

    private final OrderService orderService;

    @Autowired
    public AdminOrderController(OrderService orderService) {
        this.orderService = orderService;
    }
    
	@Autowired
	CustomerService customerService;

    @PostMapping("/orders")
    public ResponseEntity<?> createOrder(@RequestBody OrderRequestDTO orderRequest) {
        try {
            Order createdOrder = orderService.createOrder(
                1L, // ثابت الآن، استبدلها بمعرف الادمن من الجلسة او توكن
                orderRequest.getCustomerId(),
                orderRequest.getAddress(),
                (List<OrderRequestDTO.ItemQuantity>) orderRequest.getItems()
            );

            return ResponseEntity.ok(createdOrder);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Failed to create order: " + e.getMessage());
        }
    }
    

    
}