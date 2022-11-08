package com.fyj.repo;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fyj.entity.UserEntity;

@Repository
public interface UserRepository extends CrudRepository<UserEntity, BigInteger>{
	
	public UserEntity findByLoginIdAndPasswordAndActive(String loginId,String password,String active);
	public UserEntity findByLoginIdAndActive(String loginId,String active);
	
}
