package com.fyj.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fyj.entity.ProfileMasterEntity;

@Repository
public interface ProfileMasterRepository extends CrudRepository<ProfileMasterEntity, Integer>{
	
}
