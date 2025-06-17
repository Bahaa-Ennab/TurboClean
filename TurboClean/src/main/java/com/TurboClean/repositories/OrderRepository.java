package com.TurboClean.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.TurboClean.models.Order;
import com.TurboClean.models.User;

@Repository
public interface OrderRepository extends CrudRepository<Order, Long> {
	List<Order> findAll();
	List<Order> findAllByUser(User user);
	Optional<Order> findById(Long id);

}
