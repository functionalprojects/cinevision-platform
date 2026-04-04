package com.kaankaplan.userservice.business.abstracts;

import com.kaankaplan.userservice.entity.Claim;

public interface ClaimService {
    Claim getClaimByClaimName(String claimName);
}