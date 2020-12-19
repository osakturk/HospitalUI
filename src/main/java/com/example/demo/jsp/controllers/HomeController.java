package com.example.demo.jsp.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @GetMapping({"/","/login"})
    public String welcome() {
        return "login";
    }

    @GetMapping({"/index"})
    public String index() {
        return "index";
    }

    @GetMapping({"/patients"})
    public String patients() {
        return "patients";
    }

    @GetMapping({"/doctors"})
    public String doctors() {
        return "doctors";
    }

    @GetMapping({"/diseases"})
    public String diseases() {
        return "diseases";
    }

    @GetMapping({"/hospitals"})
    public String hospitals() {
        return "hospitals";
    }

    @GetMapping({"/dissections"})
    public String dissections() {
        return "dissections";
    }

    @GetMapping({"/appointments"})
    public String appointments() {
        return "appointments";
    }

    @GetMapping({"/medicines"})
    public String medicines() {
        return "medicines";
    }

    @GetMapping({"/users"})
    public String users() {
        return "users";
    }
}
