package com.TurboClean.models;
//OrderRequestDTO.java

public class OrderRequestDTO {
 private Long customerId;
 private String address;
 private Iterable<Long> items;

 public static class ItemQuantity {
     private Long id;
     private int qty;

     // getters & setters
     public Long getId() { return id; }
     public void setId(Long id) { this.id = id; }

     public int getQty() { return qty; }
     public void setQty(int qty) { this.qty = qty; }
 }

 // getters & setters
 public Long getCustomerId() { return customerId; }
 public void setCustomerId(Long customerId) { this.customerId = customerId; }

 public String getAddress() { return address; }
 public void setAddress(String address) { this.address = address; }

 public Iterable<Long> getItems() { return items; }
 public void setItems(Iterable<Long> items) { this.items = items; }

}
