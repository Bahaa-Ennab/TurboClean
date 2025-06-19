package com.TurboClean.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.TurboClean.models.Admin;
import com.TurboClean.models.LoginAdmin;
import com.TurboClean.repositories.AdminRepository;

@Service
public class AdminServices {

	@Autowired
	AdminRepository adminRepository;

	public Admin login(LoginAdmin adminLogin, BindingResult bindingResult) {

		// Find user in the DB by email
		Optional<Admin> LoginAdmin = adminRepository.findByEmail(adminLogin.getEmail());
		if (LoginAdmin.isEmpty()) {
			bindingResult.rejectValue("email", "Not Found", "Email does not exist");
			return null;
		}

		// Get the user object
		Admin admin = LoginAdmin.get();

		// Reject if BCrypt password match fails
		if (!BCrypt.checkpw(adminLogin.getPassword(), admin.getPassword())) {
		    bindingResult.rejectValue("password", "invalid", "Email or Password does not exist");

		}

		// Return null if result has errors
		if (bindingResult.hasErrors()) {
			return null;
		} else {
			return admin;
		}
	}

	public Admin register(Admin admin, BindingResult bindingResult) {
		// Check if email is already taken
		Optional<Admin> potentialNewAdmin = adminRepository.findByEmail(admin.getEmail());
		if (potentialNewAdmin.isPresent()) {
			bindingResult.rejectValue("email", "Email.Exsists", "This Email already exists!");
		}

		// Check if passwords match
		if (!admin.getPassword().equals(admin.getConfirmPassword())) {
			bindingResult.rejectValue("password", "Not.Match", "Passwords not match!");
		}

		// Return null if result has errors
		if (bindingResult.hasErrors()) {
			return null;
		}

		// Hash and set password, save user to database
		String hashedPassword = BCrypt.hashpw(admin.getPassword(), BCrypt.gensalt());
		admin.setPassword(hashedPassword);
		return adminRepository.save(admin);
		

	}
	public List<Admin> allAdmin() {
        return adminRepository.findAll();
    }
	public Admin createAdmin(Admin a) {
        return adminRepository.save(a);
    }
	
	public Admin findAdmin(Long id) {
        return adminRepository.findById(id).orElse(null);
    }

	
	public void deleteAdmin(Long id) {
		adminRepository.deleteById(id);
	}
	
	public Admin updateAdmin(Admin a) {
		return adminRepository.save(a);
	}

}
