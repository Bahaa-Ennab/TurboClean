package com.TurboClean.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TurboClean.models.Customer;
import com.TurboClean.models.Order;
import com.TurboClean.repositories.OrderRepository;

@Service
public class OrderService {

	@Autowired
	OrderRepository orderRepository;
	
	public List<Order> allOrders() {
        return orderRepository.findAll();
    }
	public Order createOrder(Order o) {
        return orderRepository.save(o);
    }
	
	public Order findOrder(Long id) {
        return orderRepository.findById(id).orElse(null);
    }
	public List<Order> findAllByCustomer(Customer customer){
		return orderRepository.findAllByCustomer(customer);
	}
	
	public void deleteOrder(Long id) {
		orderRepository.deleteById(id);
	}
	
	public Order updateOrder(Order o) {
		return orderRepository.save(o);
	}
}
