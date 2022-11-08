package com.fyj.repo;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fyj.entity.UserProjectHistoryEntity;

@Repository
public interface UserProjectHistoryRepository extends CrudRepository<UserProjectHistoryEntity, BigInteger>{
	
}
