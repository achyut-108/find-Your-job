package com.fyj.api.gateway.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fyj.api.gateway.entity.InstitutionMasterEntity;

@Repository
public interface InstitutionMasterRepository extends CrudRepository<InstitutionMasterEntity, Integer>{
	
	public InstitutionMasterEntity findByInstitutionName(String institutionName);
}
