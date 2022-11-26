package com.jobseeker.repo;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jobseeker.entity.UserProjectHistoryEntity;

@Repository
public interface UserProjectHistoryRepository extends CrudRepository<UserProjectHistoryEntity, BigInteger>{
	
	List<UserProjectHistoryEntity> findByEmploymentId(Integer employmentId);
	
}
