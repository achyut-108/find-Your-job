package com.recruiter.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.recruiter.entity.JobTypeMasterEntity;

@Repository
public interface JobTypeMasterRepository extends CrudRepository<JobTypeMasterEntity, Integer>{
}
