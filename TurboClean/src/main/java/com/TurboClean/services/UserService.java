//package com.TurboClean.services;
//
//
//import java.util.Optional;
//
//import org.mindrot.jbcrypt.BCrypt;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.validation.BindingResult;
//
//import com.TurboClean.models.LoginUser;
//import com.TurboClean.repositories.UserRepository;
//
//@Service
//public class UserService {
//	
//	
//	@Autowired
//	UserRepository userRepo;
//	
//	public User getUserById(Long Id) {
//		return userRepo.findById(Id).orElse(null);
//	}
//	
//	public User Login(LoginUser userLogin, BindingResult bindingResult) {
//		
//		// Find user in the DB by email
//		Optional<User> loginUser = userRepo.findByEmail(userLogin.getEmail());
//		if (loginUser.isEmpty()) {
//			bindingResult.rejectValue( "email", "Not Found" , "Email does not exist" );
//			return null;
//		}
//		
//		// Get the user object
//		User user = loginUser.get();
//		
//		 // Reject if BCrypt password match fails
//		if (!BCrypt.checkpw(userLogin.getPassword(), user.getPassword())) {
//			bindingResult.rejectValue("password", "invalid" , "Email or Password does not exist");
//		}
//		
//		// Return null if result has errors
//    	if (bindingResult.hasErrors()) {
//    		return null;
//    	}
//    	else {
//    		return user;
//    	}
//	}
//	
//	public User register(User user , BindingResult bindingResult) {
//		// Check if email is already taken
//		Optional<User> potentialNewUser = userRepo.findByEmail(user.getEmail());
//		if (potentialNewUser.isPresent()) {
//			bindingResult.rejectValue("email", "Email.Exsists", "This Email already exists!" );
//		}
//		
//    // Check if passwords match
//		if (!user.getPassword().equals(user.getConfirmPassword())) {
//			bindingResult.rejectValue("password", "Not.Match", "Passwords not match!" );
//		}
//		
//    // Return null if result has errors
//		if (bindingResult.hasErrors()) {
//			return null;
//		}
//
//    // Hash and set password, save user to database
//		String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
//		user.setPassword(hashedPassword);
//		return userRepo.save(user);
//
//	}
//}