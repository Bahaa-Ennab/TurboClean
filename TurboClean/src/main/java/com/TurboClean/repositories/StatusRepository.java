package com.TurboClean.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.TurboClean.models.Order;
import com.TurboClean.models.Status;
@Repository
public interface StatusRepository extends CrudRepository<Status, Long> {
	Optional<Status> findById(Long id);
	Optional<Status> findByStatuscondition(String statuscondition);


}
