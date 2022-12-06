package com.fyj.api.gateway.repo;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fyj.api.gateway.entity.CompanyMasterEntity;

@Repository
public interface CompanyMasterRepository extends CrudRepository<CompanyMasterEntity, Integer>{
	
	public CompanyMasterEntity findByUserId(BigInteger userId);
	public CompanyMasterEntity findByCompanyName(String companyName);
}
