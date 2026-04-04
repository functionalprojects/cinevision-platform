package com.kaankaplan.userservice.business.abstracts;

import com.kaankaplan.userservice.entity.User;
import com.kaankaplan.userservice.entity.dto.UserRegisterRequestDto;

public interface UserService {
    Boolean isUserExist(String userId);
    void addUser(UserRegisterRequestDto userRegisterRequestDto);
    User getUserByEmail(String email);
    boolean isUserCustomer();
    boolean isUserAdmin();
}