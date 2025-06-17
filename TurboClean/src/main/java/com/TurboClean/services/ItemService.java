package com.TurboClean.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.TurboClean.models.Item;
import com.TurboClean.models.Order;
import com.TurboClean.repositories.ItemRepository;

public class ItemService {

	@Autowired
	ItemRepository itemRepository;
	
	public List<Item> allItems() {
        return itemRepository.findAll();
    }
	public Item createOrder(Item i) {
        return itemRepository.save(i);
    }
	
	public Item findItem(Long id) {
        return itemRepository.findById(id).orElse(null);
    }
	public List<Item> findAllByOrder(Order order){
		return itemRepository.findAllByOrder(order);
	}
	
	public void deleteItem(Long id) {
		itemRepository.deleteById(id);
	}
	
	public Item updateItem(Item i) {
		return itemRepository.save(i);
	}
}
