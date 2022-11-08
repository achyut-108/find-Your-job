package com.recruiter.domain.job;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.recruiter.common.CommonServiceResponse;
import com.recruiter.entity.CompanyJobsAndDetailsEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class JobDetailsResponse extends CommonServiceResponse implements Serializable {
	public static final long serialVersionUID = 1L;

}