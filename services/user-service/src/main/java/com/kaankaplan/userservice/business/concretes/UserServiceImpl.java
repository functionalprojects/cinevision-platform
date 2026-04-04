package com.kaankaplan.userservice.business.concretes;

import com.kaankaplan.userservice.business.abstracts.ClaimService;
import com.kaankaplan.userservice.business.abstracts.UserService;
import com.kaankaplan.userservice.dao.UserDao;
import com.kaankaplan.userservice.entity.Claim;
import com.kaankaplan.userservice.entity.User;
import com.kaankaplan.userservice.entity.dto.UserRegisterRequestDto;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserDao userDao;
    private final ClaimService claimService;
    private final PasswordEncoder passwordEncoder;

    @Override
    public Boolean isUserExist(String userId) {
        User user = userDao.findUserByUserId(userId);
        return user != null;
    }

    @Override
    public void addUser(UserRegisterRequestDto userRegisterRequestDto) {
        Claim claim = claimService.getClaimByClaimName("CUSTOMER");
        User user = User.builder()
                .email(userRegisterRequestDto.getEmail())
                .password(passwordEncoder.encode(userRegisterRequestDto.getPassword()))
                .fullName(userRegisterRequestDto.getCustomerName())
                .claim(claim)
                .build();
        userDao.insert(user);
    }

    @Override
    public User getUserByEmail(String email) {
        return userDao.findUserByEmail(email);
    }

    @Override
    public boolean isUserCustomer() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authentication.getAuthorities().stream()
                .anyMatch(a -> a.getAuthority().equals("ROLE_CUSTOMER"));
    }

    @Override
    public boolean isUserAdmin() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authentication.getAuthorities().stream()
                .anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"));
    }
}