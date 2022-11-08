package com.recruiter.repo;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.recruiter.entity.CompanyJobsEntity;

@Repository
public interface CompanyJobsRepository extends CrudRepository<CompanyJobsEntity, BigInteger>{
	
}
