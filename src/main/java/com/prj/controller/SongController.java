package com.prj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SongController {
	
	@GetMapping("/song")
	public String song() {
		
		return "map";
	}
	
}
