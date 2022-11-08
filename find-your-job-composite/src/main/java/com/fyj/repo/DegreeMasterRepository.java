package com.fyj.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fyj.entity.DegreeMasterEntity;
import com.fyj.entity.InstitutionMasterEntity;

@Repository
public interface DegreeMasterRepository extends CrudRepository<DegreeMasterEntity, Integer>{
}
