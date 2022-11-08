package com.jobseeker.repo;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jobseeker.entity.CompanyJobsEntity;

@Repository
public interface CompanyJobsRepository extends CrudRepository<CompanyJobsEntity, BigInteger>{
	
}
