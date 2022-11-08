package com.recruiter.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.recruiter.entity.UserEmploymentHistoryEntity;

@Repository
public interface UserEmploymentHistoryRepository extends CrudRepository<UserEmploymentHistoryEntity, Integer>{
}
