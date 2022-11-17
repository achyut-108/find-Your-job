package com.jobseeker.domain.jobapply;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.jobseeker.common.CommonServiceResponse;
import com.jobseeker.entity.CompanyJobsAndDetailsEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class JobsAppliedResponse extends CommonServiceResponse implements Serializable {
	public static final long serialVersionUID = 1L;

	private List<JobApplicationDetails> jobsApplied;

	public List<JobApplicationDetails> getJobsApplied() {
		return jobsApplied;
	}

	public void setJobsApplied(List<JobApplicationDetails> jobsApplied) {
		this.jobsApplied = jobsApplied;
	}

	@Override
	public String toString() {
		return "JobsAppliedResponse [jobsApplied=" + jobsApplied + "]";
	}

}