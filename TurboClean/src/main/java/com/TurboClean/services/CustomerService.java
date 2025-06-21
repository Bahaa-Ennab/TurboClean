package com.TurboClean.services;


import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.TurboClean.models.Customer;
import com.TurboClean.models.LoginCustomer;
import com.TurboClean.repositories.CustomerRepository;


@Service
public class CustomerService {
	
	
	@Autowired
	CustomerRepository Customerrepo;
	
	public Customer getUserById(Long Id) {
		return Customerrepo.findById(Id).orElse(null);
	}
	
	public List<Customer> allCustomers() {
        return Customerrepo.findAll();
    }
	public Customer Login(LoginCustomer customerLogin, BindingResult bindingResult) {
		
		// Find user in the DB by email
		Optional<Customer> LoginCustomer = Customerrepo.findByEmail(customerLogin.getEmail());
		if (LoginCustomer.isEmpty()) {
			bindingResult.rejectValue( "email", "Not Found" , "Email does not exist" );
			return null;
		}
		
		// Get the user object
		Customer customer = LoginCustomer.get();
		
		 // Reject if BCrypt password match fails
		if (!BCrypt.checkpw(customerLogin.getPassword(), customer.getPassword())) {
			bindingResult.rejectValue("password", "invalid" , "Email or Password does not exist");
		}
		
		// Return null if result has errors
    	if (bindingResult.hasErrors()) {
    		return null;
    	}
    	else {
    		return customer;
    	}
	}
	
	public Customer register(Customer customer , BindingResult bindingResult) {
		// Check if email is already taken
		Optional<Customer> potentialNewCustomer = Customerrepo.findByEmail(customer.getEmail());
		if (potentialNewCustomer.isPresent()) {
			bindingResult.rejectValue("email", "Email.Exsists", "This Email already exists!" );
		}
		
    // Check if passwords match
		if (!customer.getPassword().equals(customer.getConfirmPassword())) {
			bindingResult.rejectValue("password", "Not.Match", "Passwords not match!" );
		}
		
    // Return null if result has errors
		if (bindingResult.hasErrors()) {
			return null;
		}

    // Hash and set password, save user to database
		String hashedPassword = BCrypt.hashpw(customer.getPassword(), BCrypt.gensalt());
		customer.setPassword(hashedPassword);
		return Customerrepo.save(customer);

	}
	public List<Customer> searchCustomers(String keyword) {
	    List<Customer> results = new ArrayList<>();
	    
	    try {
	        Long id = Long.parseLong(keyword);
	        Customer byId = Customerrepo.findById(id).orElse(null);
	        if (byId != null) results.add(byId);
	    } catch (NumberFormatException e) {
	        // Not an ID, ignore
	    }

	    results.addAll(Customerrepo.findByFirstNameContainingIgnoreCase(keyword));
	    results.addAll(Customerrepo.findByFirstNameContainingIgnoreCase(keyword));

	    // ممكن تشيل التكرارات لو بدك
	    return results;
	}

	
	public void updateCustomer(Customer updatedCustomer) {
	    Optional<Customer> optionalCustomer = Customerrepo.findById(updatedCustomer.getId());
	    if (optionalCustomer.isPresent()) {
	        Customer existingCustomer = optionalCustomer.get();

	        existingCustomer.setFirstName(updatedCustomer.getFirstName());
	        existingCustomer.setLastName(updatedCustomer.getLastName());
	        existingCustomer.setPhoneNumber(updatedCustomer.getPhoneNumber());

	        // ✅ فقط إذا الإيميل مش مكرر أو لم يتغير
	        existingCustomer.setEmail(updatedCustomer.getEmail());

	        existingCustomer.setLocation(updatedCustomer.getLocation());

	        Customerrepo.save(existingCustomer);
	    } else {
	        throw new RuntimeException("Customer not found");
	    }
	}



}