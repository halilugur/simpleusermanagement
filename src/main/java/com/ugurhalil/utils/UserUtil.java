package com.ugurhalil.utils;

import com.google.gson.Gson;
import com.ugurhalil.form.UserForm;
import com.ugurhalil.models.UserModel;
import org.springframework.validation.BindingResult;

public class UserUtil {

    public static UserModel fillModel(UserForm userForm) {
        UserModel userModel = new UserModel();
        userModel.setId(userForm.getId());
        userModel.setName(userForm.getName());
        userModel.setLastName(userForm.getLastName());
        userModel.setHandPhone(userForm.getPhone());
        return userModel;
    }

    public static String toJsonFailObject(BindingResult bindingResult) {
        Gson gson = new Gson();
        return gson.toJson(bindingResult.getAllErrors());
    }
}
