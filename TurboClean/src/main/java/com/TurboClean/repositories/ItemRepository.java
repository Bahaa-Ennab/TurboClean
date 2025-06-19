package com.TurboClean.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.TurboClean.models.Item;
import com.TurboClean.models.Order;

@Repository
public interface ItemRepository extends CrudRepository<Item, Long> {
	List<Item> findAll();
	Optional<Item> findById(Long id);
	List<Item> findAllByOrders(Order order);

}
