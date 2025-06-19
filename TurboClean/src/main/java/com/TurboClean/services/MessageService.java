package com.TurboClean.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TurboClean.models.Admin;
import com.TurboClean.models.Customer;
import com.TurboClean.models.Message;
import com.TurboClean.repositories.MessageRepository;

@Service
public class MessageService {

	@Autowired
	MessageRepository messageRepository;
	
	public List<Message> allMessages() {
        return messageRepository.findAll();
    }
	public Message createMessage(Message m) {
        return messageRepository.save(m);
    }
	
	public Message findMessage(Long id) {
        return messageRepository.findById(id).orElse(null);
    }
	public List<Message> findAllByAdmin(Admin admin){
		return messageRepository.findAllByAdmin(admin);
	}
	
	public List<Message> findAllByCustomer(Customer customer){
		return messageRepository.findAllByCustomer(customer);
	}
	
	public void deleteMessage(Long id) {
		messageRepository.deleteById(id);
	}
	
	public Message updateMessage(Message m) {
		return messageRepository.save(m);
	}
}
