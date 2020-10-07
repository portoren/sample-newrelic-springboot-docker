package com.example.demo.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {
    
    @GetMapping("/test-demo")
    public String getData() {
        return "Jugando con springboot y docker";
    }

}
