package com.TurboClean.models;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "admins")
public class Admin {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotNull
	@Size(min = 3, max = 30, message = "First Name must be more than 3 characters")
	private String firstName;

	@NotNull
	@Size(min = 3, max = 30, message = "Last Name must be more 3 characters")
	private String lastName;
	
	@NotNull(message = "Email cannot be null")
	@Email(message = "Invalid email address format")
	@Column(unique = true , nullable = false)
	private String email;

	@NotNull
	@Pattern(regexp = "\\d{10}", message = "Phone number must be exactly 10 digits")
	private String phoneNumber;
	
	@NotNull
	@Size(min = 8, max = 200, message = "The password must be between 8 and 200 characters")
	private String password;

	@Transient
	@NotEmpty(message = "Confirm Password is required!")
	@Size(min = 8, max = 128, message = "Confirm Password must be between 8 and 128 characters")
	private String confirmPassword;

	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date createdAt;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date updatedAt;
	
	@OneToMany(mappedBy="admin", fetch = FetchType.LAZY)
    private List<Order> orders;
	
	@OneToMany(mappedBy="admin", fetch = FetchType.LAZY)
    private List<Message> messages;
	

}
