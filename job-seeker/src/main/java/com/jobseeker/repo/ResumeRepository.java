package com.jobseeker.repo;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jobseeker.entity.ResumeEntity;

@Repository
public interface ResumeRepository extends CrudRepository<ResumeEntity, BigInteger>{
	
	public ResumeEntity findByUserId(BigInteger userId);
}
