package com.jobseeker.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jobseeker.entity.RoleMasterEntity;

@Repository
public interface RoleMasterRepository extends CrudRepository<RoleMasterEntity, Integer>{
	
}
