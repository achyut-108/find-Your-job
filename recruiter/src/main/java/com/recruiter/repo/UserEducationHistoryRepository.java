package com.recruiter.repo;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.recruiter.entity.UserDetailsEntity;
import com.recruiter.entity.UserEducationHistoryEntity;

@Repository
public interface UserEducationHistoryRepository extends CrudRepository<UserEducationHistoryEntity, BigInteger>{
}
