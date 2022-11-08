package com.recruiter.repo;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.recruiter.entity.UserDetailsEntity;

@Repository
public interface UserDetailsRepository extends CrudRepository<UserDetailsEntity, BigInteger>{
}
