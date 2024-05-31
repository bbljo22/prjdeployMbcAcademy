package com.prj.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.prj.service.UserService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class HomeController {
	
	@Autowired
	UserService service;
	
	@GetMapping("/")
	public String home() {
		return "home";//prefix + home +suffix =>servlet-context.xml에 있다 
	}
	
	@GetMapping("/api/hello")
	public String flaskApp() {
		System.out.println("플라스크에서의 연동되었어요");
		return "image";
	}
	@GetMapping("/aa")
	public String f() {
		System.out.println("여기는 chatbot 연결하고 싶어요. 플라스크에서의 연동외었어요");
		return "image1";
	}
	

	
}
