package com.ugurhalil.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserManagementController {

    @GetMapping("/")
    public String userListPage() {
        return "userPage";
    }

}
