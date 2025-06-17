package com.TurboClean.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.TurboClean.services.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userSerivce;
}
