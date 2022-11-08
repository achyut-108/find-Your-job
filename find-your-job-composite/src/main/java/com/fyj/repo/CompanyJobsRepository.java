package com.fyj.repo;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fyj.entity.CompanyJobsEntity;

@Repository
public interface CompanyJobsRepository extends CrudRepository<CompanyJobsEntity, BigInteger>{
	
}
