package com.recruiter.repo;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.recruiter.entity.UserProjectHistoryEntity;

@Repository
public interface UserProjectHistoryRepository extends CrudRepository<UserProjectHistoryEntity, BigInteger>{
	
}
