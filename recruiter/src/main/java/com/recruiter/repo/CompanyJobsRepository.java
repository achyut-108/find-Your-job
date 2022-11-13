package com.recruiter.repo;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.recruiter.entity.CompanyJobsEntity;

@Repository
public interface CompanyJobsRepository extends CrudRepository<CompanyJobsEntity, BigInteger>{
	
	@Query(value = "select cj.job_id,cj.company_id,cj.job_title,cj.job_description,\r\n"
			+ "cj.job_type_id,cjd.job_details_id,cjd.salary_per_hour,\r\n"
			+ "cjd.skills_required, cjd.job_location, cjd.creation_Date, cjd.end_date, cjd.ctc_offered,\r\n"
			+ "cm.company_name,cm.company_description\r\n"
			+ "from company_jobs cj, company_job_details cjd, m_company cm\r\n"
			+ "where cj.job_id = cjd.job_id and cm.company_id = cj.company_id\r\n"
			+ "and cm.user_id = ?1",  nativeQuery = true)
	public List<Object[]> jobsPostedByARecruiter(BigInteger userId);
	
}
