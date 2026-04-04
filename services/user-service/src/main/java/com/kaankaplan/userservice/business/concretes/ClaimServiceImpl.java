package com.kaankaplan.userservice.business.concretes;

import com.kaankaplan.userservice.business.abstracts.ClaimService;
import com.kaankaplan.userservice.dao.ClaimDao;
import com.kaankaplan.userservice.entity.Claim;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ClaimServiceImpl implements ClaimService {

    private final ClaimDao claimDao;

    @Override
    public Claim getClaimByClaimName(String claimName) {
        return claimDao.getClaimByClaimName(claimName);
    }
}