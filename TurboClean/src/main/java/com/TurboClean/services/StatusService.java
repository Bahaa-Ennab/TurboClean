package com.TurboClean.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TurboClean.models.Status;
import com.TurboClean.repositories.StatusRepository;

@Service
public class StatusService {
    @Autowired
    private StatusRepository statusRepository;
    
	public Status findStatus(Long id) {
        return statusRepository.findById(id).orElse(null);
    }
}
