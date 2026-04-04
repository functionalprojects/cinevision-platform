package com.kaankaplan.userservice.core.security;

import org.springframework.security.core.Authentication;

public interface JwtProviderService {
    String generateToken(Authentication authentication);
}