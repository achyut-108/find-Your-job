package com.fyj.repo;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fyj.entity.CompanyMasterEntity;

@Repository
public interface CompanyMasterRepository extends CrudRepository<CompanyMasterEntity, Integer>{
	
	public CompanyMasterEntity findByUserId(BigInteger userId);
}
