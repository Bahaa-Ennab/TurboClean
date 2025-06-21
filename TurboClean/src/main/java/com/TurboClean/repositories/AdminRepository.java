package com.TurboClean.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.TurboClean.models.Admin;
import com.TurboClean.models.Order;

@Repository
public interface AdminRepository extends CrudRepository<Admin, Long> {

	Optional<Admin> findByEmail(String email);
	List<Admin> findAll();
	Optional<Admin> findById(Long id);


}
