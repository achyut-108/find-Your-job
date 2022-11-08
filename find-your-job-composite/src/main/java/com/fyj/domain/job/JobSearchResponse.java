package com.fyj.domain.job;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fyj.common.CommonServiceResponse;
import com.fyj.entity.CompanyJobsAndDetailsEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class JobSearchResponse extends CommonServiceResponse implements Serializable {
	public static final long serialVersionUID = 1L;

	private List<CompanyJobsAndDetailsEntity> companyjobsAndDetailsList;
}