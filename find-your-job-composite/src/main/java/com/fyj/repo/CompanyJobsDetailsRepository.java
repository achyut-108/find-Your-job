package com.fyj.repo;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fyj.entity.CompanyJobsDetailsEntity;

@Repository
public interface CompanyJobsDetailsRepository extends CrudRepository<CompanyJobsDetailsEntity, BigInteger> {

	public CompanyJobsDetailsEntity findByJobId(BigInteger jobId);
	public void deleteByJobId(BigInteger jobId);

}
