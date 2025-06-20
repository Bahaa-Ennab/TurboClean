package com.TurboClean.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TurboClean.models.Status;
import com.TurboClean.repositories.StatusRepository;


@Service
public class StatusService {

	@Autowired
	StatusRepository statusRepository;
	
	public Status findByStatuscondition(String inProgress) {
	    return statusRepository.findByStatuscondition(inProgress)
	                           .orElseThrow(() -> new RuntimeException("Status not found"));
	}
  
  	public Status findStatus(Long id) {
        return statusRepository.findById(id).orElse(null);
    }

}
