package com.fyj.repo;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fyj.entity.UserDetailsEntity;
import com.fyj.entity.UserEducationHistoryEntity;

@Repository
public interface UserEducationHistoryRepository extends CrudRepository<UserEducationHistoryEntity, BigInteger>{
}
