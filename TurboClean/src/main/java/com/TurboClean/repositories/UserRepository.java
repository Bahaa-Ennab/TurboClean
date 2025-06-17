package com.TurboClean.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.TurboClean.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {

}
