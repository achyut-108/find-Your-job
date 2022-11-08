package com.jobseeker.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jobseeker.entity.UserEmploymentHistoryEntity;

@Repository
public interface UserEmploymentHistoryRepository extends CrudRepository<UserEmploymentHistoryEntity, Integer>{
}
