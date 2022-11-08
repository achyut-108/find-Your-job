package com.fyj.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fyj.entity.JobTypeMasterEntity;

@Repository
public interface JobTypeMasterRepository extends CrudRepository<JobTypeMasterEntity, Integer>{
}
