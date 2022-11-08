package com.fyj.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fyj.entity.InstitutionMasterEntity;

@Repository
public interface InstitutionMasterRepository extends CrudRepository<InstitutionMasterEntity, Integer>{
}
