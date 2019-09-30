package com.ugurhalil.controllers;

import com.ugurhalil.utils.UserUtil;
import com.ugurhalil.form.UserForm;
import com.ugurhalil.services.UserService;
import com.ugurhalil.validators.UserFormValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

    private final String SUCCESS = "{\"status\":200}";
    private final String EMPTY = "{\"status\":\"empty\"}";
    private final String USER_PAGE = "userPage";
    private final String REDIRECT_USER_PAGE = "redirect:/";

    @Autowired
    private UserService userService;

    @Autowired
    private UserFormValidator userFormValidator;

    @GetMapping("/")
    public String userListPage(Model model) {

        model.addAttribute("users", userService.getAllUser());

        return USER_PAGE;
    }

    @PostMapping(value = "/", produces = "application/json")
    @ResponseBody
    public String saveUser(@ModelAttribute UserForm userForm, BindingResult bindingResult) {
        userFormValidator.validate(userForm, bindingResult);

        // Ajax response delay for show loading modal popup
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        //

        if (bindingResult.hasErrors()) {
            return UserUtil.toJsonFailObject(bindingResult);
        }
        userService.saveUser(UserUtil.fillModel(userForm));
        return SUCCESS;
    }

    @PostMapping(value = "/delete")
    public String deleteUser(@RequestParam String id) {
        if (!StringUtils.isEmpty(id)) {
            userService.deleteUser(id);
        }
        return REDIRECT_USER_PAGE;
    }

}
