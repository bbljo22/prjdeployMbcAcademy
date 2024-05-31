package com.prj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Arrays;
import java.util.List;

@Controller
public class InciController {
	
	@GetMapping("/main")
    public String main() {
        return "inci/main";
    }
	
    @GetMapping("/incident")
    public String incident() {
        return "inci/incident";
    }
    
    @GetMapping("/etcincident")
    public String timeincident() {
        return "inci/etcincident";
    }
    
    @GetMapping("/weatherTempRain")
    public String weather_Temp_rain() {
        return "inci/weatherTempRain";
    }
    
    
    
}
