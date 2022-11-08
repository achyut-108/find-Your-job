package com.fyj.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fyj.entity.DepartmentMasterEntity;

@Repository
public interface DepartmentMasterRepository extends CrudRepository<DepartmentMasterEntity, Integer>{
	
}
