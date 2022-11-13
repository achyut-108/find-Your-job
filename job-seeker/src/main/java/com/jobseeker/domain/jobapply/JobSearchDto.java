package com.jobseeker.domain.jobapply;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.jobseeker.entity.CompanyJobsDetailsEntity;
import com.jobseeker.entity.CompanyJobsEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class JobSearchDto {

	private CompanyJobsEntity companyJobsEntity;
	private CompanyJobsDetailsEntity companyJobsDetailsEntity;

}
