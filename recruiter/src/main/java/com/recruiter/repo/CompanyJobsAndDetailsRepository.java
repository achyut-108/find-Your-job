package com.recruiter.repo;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.recruiter.entity.CompanyJobsAndDetailsEntity;

@Repository
public interface CompanyJobsAndDetailsRepository extends CrudRepository<CompanyJobsAndDetailsEntity, BigInteger>{
	
	
	
}
