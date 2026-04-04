package com.kaankaplan.userservice.dao;

import com.kaankaplan.userservice.entity.Claim;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface ClaimDao extends MongoRepository<Claim, String> {
    Claim getClaimByClaimName(String claimName);
}