package com.TurboClean.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.TurboClean.models.Admin;
import com.TurboClean.models.Customer;
import com.TurboClean.models.Order;
import com.TurboClean.models.Status;

@Repository
public interface OrderRepository extends CrudRepository<Order, Long> {
	List<Order> findAll();
	List<Order> findAllByCustomer(Customer customer);
	List<Order> findAllByStatus(Status status);
	List<Order> findAllByAdmin(Admin admin);
	Optional<Order> findById(Long id);
	Long countByStatus_Statuscondition(String statuscondition);
	

}
