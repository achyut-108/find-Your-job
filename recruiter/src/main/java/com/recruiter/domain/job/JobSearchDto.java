package com.recruiter.domain.job;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.recruiter.entity.CompanyJobsDetailsEntity;
import com.recruiter.entity.CompanyJobsEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class JobSearchDto {

	private CompanyJobsEntity companyJobsEntity;
	private CompanyJobsDetailsEntity companyJobsDetailsEntity;

}
