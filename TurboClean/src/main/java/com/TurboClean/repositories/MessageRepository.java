package com.TurboClean.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.TurboClean.models.Message;
import com.TurboClean.models.Order;
import com.TurboClean.models.User;
@Repository
public interface MessageRepository extends CrudRepository<Message, Long> {
	List<Message> findAll();
	List<Message> findAllByUser(User user);
	Optional<Message> findById(Long id);
}
