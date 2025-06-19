package com.TurboClean.models;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "status")
public class Status {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotNull
	@Size(min = 4, max = 200, message = "condition must be provided")
	private String Stauscondition;
	
	@OneToOne(mappedBy="status", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
    private Order order;

	public Status(String Stauscondition) {
		this.Stauscondition = Stauscondition;
	}



	public String getCondition() {
		return Stauscondition;
	}



	public void setCondition(String Stauscondition) {
		this.Stauscondition = Stauscondition;
	}



	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Status(Long id, @NotNull @Size(min = 4, max = 200, message = "condition must be provided") String Stauscondition,
			Order order) {
		super();
		this.id = id;
		this.Stauscondition = Stauscondition;
		this.order = order;
	}

	public Status() {
		super();
	}
	
	
	
}
