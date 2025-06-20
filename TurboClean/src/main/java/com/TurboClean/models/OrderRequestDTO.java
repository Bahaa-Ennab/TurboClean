package com.TurboClean.models;

import java.util.List;

//OrderRequestDTO.java

public class OrderRequestDTO {
    private Long customerId;
    private String address;
    private List<ItemQuantity> items;

    public static class ItemQuantity {
        private Long id;
        private int qty;

        public Long getId() { return id; }
        public void setId(Long id) { this.id = id; }

        public int getQty() { return qty; }
        public void setQty(int qty) { this.qty = qty; }
    }

    public Long getCustomerId() { return customerId; }
    public void setCustomerId(Long customerId) { this.customerId = customerId; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public List<ItemQuantity> getItems() { return items; }
    public void setItems(List<ItemQuantity> items) { this.items = items; }
}
