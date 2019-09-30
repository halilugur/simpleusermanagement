package com.ugurhalil.validators;

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
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "Boş Geçilemez");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "Boş Geçilemez");

    }
}
