package com.kaankaplan.userservice.business.abstracts;

import com.kaankaplan.userservice.entity.dto.UserAuthenticationResponseDto;
import com.kaankaplan.userservice.entity.dto.UserLoginRequestDto;

public interface AuthService {
    UserAuthenticationResponseDto login(UserLoginRequestDto userLoginRequestDto);
}