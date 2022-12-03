package com.fyj.api.gateway.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fyj.api.gateway.entity.DegreeMasterEntity;

@Repository
public interface DegreeMasterRepository extends CrudRepository<DegreeMasterEntity, Integer>{
}
