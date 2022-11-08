package com.jobseeker.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jobseeker.entity.DegreeMasterEntity;
import com.jobseeker.entity.InstitutionMasterEntity;

@Repository
public interface DegreeMasterRepository extends CrudRepository<DegreeMasterEntity, Integer>{
}
