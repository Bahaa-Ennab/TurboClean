package com.TurboClean.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TurboClean.models.Admin;
import com.TurboClean.models.Customer;
import com.TurboClean.models.Item;
import com.TurboClean.models.Order;
import com.TurboClean.models.OrderRequestDTO;
import com.TurboClean.repositories.AdminRepository;
import com.TurboClean.repositories.CustomerRepository;
import com.TurboClean.repositories.ItemRepository;
import com.TurboClean.repositories.OrderRepository;

@Service
public class OrderService {

	@Autowired
	OrderRepository orderRepository;
	

    @Autowired
    private ItemRepository itemRepo;
    
    @Autowired
    private AdminRepository adminRepo;
    
    @Autowired
    private CustomerRepository customerRepo;
	
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
	
	 public Order saveOrder(OrderRequestDTO dto) {
	        Order order = new Order();

	        // جلب العناصر المرتبطة
	        List<Item> items =(List<Item>) itemRepo.findAllById(dto.getItems());

	        // حساب التكلفة الكلية
	        double totalCost = items.stream().mapToDouble(Item::getCost).sum();

	        order.setItems(items);
	        order.setTotal_cost(totalCost);
	        order.setAddress(dto.getAddress());
	        order.setDate(new Date());

	        Admin admin = adminRepo.findById(dto.getCustomerId()).orElseThrow();
	        Customer customer = customerRepo.findById(dto.getCustomerId()).orElseThrow();

	        order.setAdmin(admin);
	        order.setCustomer(customer);

	        return orderRepository.save(order);
	    }
}
