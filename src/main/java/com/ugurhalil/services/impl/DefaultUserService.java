package com.ugurhalil.services.impl;

import com.ugurhalil.models.UserModel;
import com.ugurhalil.repositories.UserRepository;
import com.ugurhalil.services.UserService;

import java.util.List;
import java.util.Optional;

public class DefaultUserService implements UserService {

    private UserRepository userRepository;

    public Optional<UserModel> getUserById(String id){
        return getUserRepository().findById(id);
    }

    public List<UserModel> getAllUser(){
        return getUserRepository().findAll();
    }

    public void deleteUser(String id)  {
        getUserRepository().deleteById(id);
    }

    public void saveUser(UserModel userModel){
        getUserRepository().save(userModel);
    }

    public UserRepository getUserRepository() {
        return userRepository;
    }

    public void setUserRepository(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
}
