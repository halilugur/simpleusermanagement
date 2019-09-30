package com.ugurhalil.validators;

import com.ugurhalil.form.UserForm;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class UserFormValidator implements Validator {
    @Override
    public boolean supports(Class<?> aClass) {
        return UserFormValidator.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
//        UserForm userForm = (UserForm) o;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "Boş Geçilemez");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "Boş Geçilemez");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "Boş Geçilemez");

    }
}
