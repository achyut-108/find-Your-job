package com.fyj.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fyj.entity.UserEmploymentHistoryEntity;

@Repository
public interface UserEmploymentHistoryRepository extends CrudRepository<UserEmploymentHistoryEntity, Integer>{
}
