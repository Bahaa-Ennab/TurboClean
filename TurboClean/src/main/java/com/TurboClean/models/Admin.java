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
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
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
	
	@PrePersist
	protected void onCreate() {
	    this.createdAt = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
	    this.updatedAt = new Date();
	}

	
	public Admin() {
	}

	public Admin(String firstName, String lastName, String email, String password, String confirmPassword, List<Order> orders, List<Message> messages) {

		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.confirmPassword = confirmPassword;
		this.orders = orders;
		this.messages = messages;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public List<Message> getMessages() {
		return messages;
	}

	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}

	
	

}
