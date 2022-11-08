package com.jobseeker.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jobseeker.entity.JobTypeMasterEntity;

@Repository
public interface JobTypeMasterRepository extends CrudRepository<JobTypeMasterEntity, Integer>{
}
