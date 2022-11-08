package com.fyj.api.gateway.repo;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fyj.api.gateway.entity.UserDetailsEntity;

@Repository
public interface UserDetailsRepository extends CrudRepository<UserDetailsEntity, BigInteger>{
}
