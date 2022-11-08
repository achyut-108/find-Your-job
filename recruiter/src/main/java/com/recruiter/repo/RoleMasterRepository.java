package com.recruiter.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.recruiter.entity.RoleMasterEntity;

@Repository
public interface RoleMasterRepository extends CrudRepository<RoleMasterEntity, Integer>{
	
}
