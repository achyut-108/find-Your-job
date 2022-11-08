package com.fyj.domain.job;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fyj.entity.CompanyJobsDetailsEntity;
import com.fyj.entity.CompanyJobsEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class JobSearchDto {

	private CompanyJobsEntity companyJobsEntity;
	private CompanyJobsDetailsEntity companyJobsDetailsEntity;

}
