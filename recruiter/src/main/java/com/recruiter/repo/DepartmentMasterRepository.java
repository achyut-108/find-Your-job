package com.recruiter.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.recruiter.entity.DepartmentMasterEntity;

@Repository
public interface DepartmentMasterRepository extends CrudRepository<DepartmentMasterEntity, Integer>{
	
}
