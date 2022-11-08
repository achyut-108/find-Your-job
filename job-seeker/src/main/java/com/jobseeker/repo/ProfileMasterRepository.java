package com.jobseeker.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jobseeker.entity.ProfileMasterEntity;

@Repository
public interface ProfileMasterRepository extends CrudRepository<ProfileMasterEntity, Integer>{
	
}
