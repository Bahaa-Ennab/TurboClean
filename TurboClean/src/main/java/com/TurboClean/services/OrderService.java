package com.TurboClean.services;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TurboClean.models.Admin;
import com.TurboClean.models.Customer;
import com.TurboClean.models.Item;
import com.TurboClean.models.Order;
import com.TurboClean.models.OrderItem;
import com.TurboClean.models.OrderRequestDTO;
import com.TurboClean.models.Status;
import com.TurboClean.repositories.AdminRepository;
import com.TurboClean.repositories.CustomerRepository;
import com.TurboClean.repositories.ItemRepository;
import com.TurboClean.repositories.OrderRepository;
import com.TurboClean.repositories.StatusRepository;

import jakarta.transaction.Transactional;

@Service
public class OrderService {

	@Autowired
	OrderRepository orderRepository;
	
    @Autowired
    private ItemRepository itemRepository;
    
    @Autowired
    private AdminRepository adminRepository;
    
    @Autowired
    private CustomerRepository customerRepository;
    
    @Autowired
    private StatusRepository statusRepository;
	
    public void saveOrder(Order order) {
        orderRepository.save(order);
    }
	public List<Order> allOrders() {
        return orderRepository.findAll();
    }
	
	public List<Order> findAllByStatus(Status status){
		return orderRepository.findAllByStatus(status);
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

	@Transactional
	public Order createOrder(Long adminId, Long customerId, String address, List<OrderRequestDTO.ItemQuantity> items) throws Exception {
        Admin admin = adminRepository.findById(adminId)
                .orElseThrow(() -> new Exception("Admin not found"));

        Customer customer = customerRepository.findById(customerId)
                .orElseThrow(() -> new Exception("Customer not found"));

        // مثلاً حالة الطلب الافتراضية
        Status defaultStatus = statusRepository.findById(1L).orElse(null);

        Order order = new Order();
        order.setAdmin(admin);
        order.setCustomer(customer);
        order.setAddress(address);
        order.setDate(new Date());
        order.setStatus(defaultStatus);
        System.out.print(defaultStatus.getStatuscondition());
        List<OrderItem> orderItems = new ArrayList<>();
        double totalCost = 0;

        for (OrderRequestDTO.ItemQuantity iq : items) {
            Item item = itemRepository.findById(iq.getId())
                    .orElseThrow(() -> new Exception("Item not found, id: " + iq.getId()));

            OrderItem orderItem = new OrderItem();
            orderItem.setOrder(order);
            orderItem.setItem(item);
            orderItem.setQuantity(iq.getQty());
            orderItems.add(orderItem);

            totalCost += item.getCost() * iq.getQty();
        }

        order.setOrderItems(orderItems);
        order.setTotal_cost(totalCost);

        // عند الحفظ سيحفظ الأوامر والعناصر بسبب CascadeType.ALL في العلاقة
        return orderRepository.save(order);
    }
	public Long countByStatus(String status) {
	    return orderRepository.countByStatus_Statuscondition(status);
	}
	public List<Order> findAll() {
	    return orderRepository.findAll();
	}

}
