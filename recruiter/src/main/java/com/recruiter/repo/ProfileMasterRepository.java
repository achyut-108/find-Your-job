package com.recruiter.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.recruiter.entity.ProfileMasterEntity;

@Repository
public interface ProfileMasterRepository extends CrudRepository<ProfileMasterEntity, Integer>{
	
}
