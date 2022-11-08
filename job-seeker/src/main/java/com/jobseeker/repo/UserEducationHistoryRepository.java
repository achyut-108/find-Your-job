package com.jobseeker.repo;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jobseeker.entity.UserDetailsEntity;
import com.jobseeker.entity.UserEducationHistoryEntity;

@Repository
public interface UserEducationHistoryRepository extends CrudRepository<UserEducationHistoryEntity, BigInteger>{
}
