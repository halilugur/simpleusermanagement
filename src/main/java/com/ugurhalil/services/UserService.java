package com.ugurhalil.services;

import com.ugurhalil.models.UserModel;

import java.util.List;
import java.util.Optional;

public interface UserService {

    Optional<UserModel> getUserById(String id);

    List<UserModel> getAllUser();

    void deleteUser(String id);

    void saveUser(UserModel userModel);

}
