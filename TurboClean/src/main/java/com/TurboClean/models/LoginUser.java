package com.TurboClean.models;

import jakarta.persistence.Column;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public class LoginUser {
	@NotNull(message = "Email cannot be null")
	@Email(message = "Invalid email address format")
	@Column(unique = true , nullable = false)
	private String email;

	@NotNull
	@Size(min = 8, max = 200, message = "Password must be between 8 and 200 characters")
	private String password;

	
	
	
	public LoginUser() {

	}

	public LoginUser(String email, String password) {
		this.password = password;
		this.email = email;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String username) {
		this.email = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}