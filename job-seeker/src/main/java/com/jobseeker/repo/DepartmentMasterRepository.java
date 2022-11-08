package com.jobseeker.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jobseeker.entity.DepartmentMasterEntity;

@Repository
public interface DepartmentMasterRepository extends CrudRepository<DepartmentMasterEntity, Integer>{
	
}
