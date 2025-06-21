package com.TurboClean.repositories;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.TurboClean.models.Customer;

@Repository
public interface CustomerRepository extends CrudRepository<Customer, Long> {

	Optional<Customer> findByEmail(String email);
	List<Customer> findAll();
	Optional<Customer> findById(Long id);
	Collection<? extends Customer> findByFirstNameContainingIgnoreCase(String keyword);
}
