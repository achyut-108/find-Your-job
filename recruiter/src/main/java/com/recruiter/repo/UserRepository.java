package com.recruiter.repo;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.recruiter.entity.UserEntity;

@Repository
public interface UserRepository extends CrudRepository<UserEntity, BigInteger>{
	
	public UserEntity findByLoginIdAndPasswordAndActive(String loginId,String password,String active);
	public UserEntity findByLoginIdAndActive(String loginId,String active);
	public List<UserEntity> findByUserIdIn(List<BigInteger> jobSeekerIds);
	
}
