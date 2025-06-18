package com.TurboClean.services;


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
}