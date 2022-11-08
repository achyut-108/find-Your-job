package com.jobseeker.repo;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jobseeker.entity.CompanyJobsAndDetailsEntity;

@Repository
public interface CompanyJobsAndDetailsRepository extends CrudRepository<CompanyJobsAndDetailsEntity, BigInteger>{
	
	
	
}
