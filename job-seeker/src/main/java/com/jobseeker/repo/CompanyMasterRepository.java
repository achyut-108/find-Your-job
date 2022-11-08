package com.jobseeker.repo;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jobseeker.entity.CompanyMasterEntity;

@Repository
public interface CompanyMasterRepository extends CrudRepository<CompanyMasterEntity, Integer>{
	
	public CompanyMasterEntity findByUserId(BigInteger userId);
}
