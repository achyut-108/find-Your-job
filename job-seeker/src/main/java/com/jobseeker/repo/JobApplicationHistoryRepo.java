package com.jobseeker.repo;

import java.math.BigInteger;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jobseeker.entity.JobApplicationHistoryEntity;

@Repository
public interface JobApplicationHistoryRepo extends CrudRepository<JobApplicationHistoryEntity, BigInteger>{
	
	Optional<JobApplicationHistoryEntity> findByjobIdAndJobSeekerId(BigInteger jobId, BigInteger jobSeekerId);
	
	@Query(value = "select cj.job_id,cj.company_id,cj.job_title,cj.job_description,\r\n"
			+ "cj.job_type_id,cm.company_name,cm.company_description, jah.creation_date,\r\n"
			+ "jah.active,jah.job_application_id\r\n"
			+ " from job_application_history jah, company_jobs cj, m_company cm \r\n"
			+ "where jah.job_id = cj.job_id and cj.company_id = cm.company_id and jah.job_seeker_id=?1",  nativeQuery = true)
	public List<Object[]> jobsAppliedByAjobSeeker(BigInteger jobSeekerid);
	
	@Query(value = "select count(job_seeker_id),jah.job_id\r\n"
			+ "FROM job_search.job_application_history jah\r\n"
			+ ", company_jobs cj where jah.job_id = cj.job_id \r\n"
			+ "group by jah.job_id having count(job_seeker_id)>=1 order by \r\n"
			+ "count(job_seeker_id) desc")
	public List<Object[]> jobsAppliedStatistics();
	
	
}
