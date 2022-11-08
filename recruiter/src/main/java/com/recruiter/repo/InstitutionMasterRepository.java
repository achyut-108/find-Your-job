package com.recruiter.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.recruiter.entity.InstitutionMasterEntity;

@Repository
public interface InstitutionMasterRepository extends CrudRepository<InstitutionMasterEntity, Integer>{
}
