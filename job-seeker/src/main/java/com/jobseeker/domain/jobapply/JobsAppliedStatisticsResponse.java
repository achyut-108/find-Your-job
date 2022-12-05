package com.jobseeker.domain.jobapply;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.jobseeker.common.CommonServiceResponse;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class JobsAppliedStatisticsResponse extends CommonServiceResponse implements Serializable {
	public static final long serialVersionUID = 1L;

	private List<JobAppliedStatDetails> jobsAppliedStatDetailsList;

	public List<JobAppliedStatDetails> getJobsApplied() {
		return jobsAppliedStatDetailsList;
	}

	public void setJobsApplied(List<JobAppliedStatDetails> jobsAppliedStatDetailsList) {
		this.jobsAppliedStatDetailsList = jobsAppliedStatDetailsList;
	}

	@Override
	public String toString() {
		return "JobsAppliedStatisticsResponse [jobsAppliedStatDetailsList=" + jobsAppliedStatDetailsList + "]";
	}

}