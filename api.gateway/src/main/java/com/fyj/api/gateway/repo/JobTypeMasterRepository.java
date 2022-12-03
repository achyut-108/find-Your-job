package com.fyj.api.gateway.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fyj.api.gateway.entity.JobTypeMasterEntity;

@Repository
public interface JobTypeMasterRepository extends CrudRepository<JobTypeMasterEntity, Integer>{
}
