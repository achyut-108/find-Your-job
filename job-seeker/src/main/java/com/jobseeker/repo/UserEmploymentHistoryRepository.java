package com.jobseeker.repo;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jobseeker.entity.UserEmploymentHistoryEntity;

@Repository
public interface UserEmploymentHistoryRepository extends CrudRepository<UserEmploymentHistoryEntity, Integer>{
	
	@Query(value = "select designation,employer,ueh.start_date as job_start_date, \r\n"
			+ "ueh.end_date as job_end_date,\r\n"
			+ "ueh.active as current_active_job,ueh.role as job_role,\r\n"
			+ "uph.project_description,uph.project_name, uph.start_date as project_start_date,\r\n"
			+ "uph.end_date as project_end_date\r\n"
			+ " from user_employment_history ueh, user_project_history uph \r\n"
			+ "where ueh.user_id = ?1 and ueh.user_employment_id = uph.employement_id", nativeQuery = true)
	public List<Object[]> getEmploymentHistory(BigInteger userId);
}
