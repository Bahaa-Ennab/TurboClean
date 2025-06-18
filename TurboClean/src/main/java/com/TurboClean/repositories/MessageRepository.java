package com.TurboClean.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.TurboClean.models.Admin;
import com.TurboClean.models.Customer;
import com.TurboClean.models.Message;
@Repository
public interface MessageRepository extends CrudRepository<Message, Long> {
	List<Message> findAll();
	List<Message> findAllByCustomer(Customer customer);
	List<Message> findAllByAdmin(Admin admin);

	Optional<Message> findById(Long id);
}
