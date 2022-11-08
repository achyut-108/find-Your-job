package com.fyj.api.gateway.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fyj.api.gateway.entity.RoleMasterEntity;

@Repository
public interface RoleMasterRepository extends CrudRepository<RoleMasterEntity, Integer>{
	
}
