package com.recruiter.domain.job;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.recruiter.common.CommonServiceResponse;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class JobSeekerDetailsResponse extends CommonServiceResponse implements Serializable {
	public static final long serialVersionUID = 1L;

	private List<JobSeekerDetails> jobSeekerDetails;

	public List<JobSeekerDetails> getJobSeekerDetails() {
		return jobSeekerDetails;
	}

	public void setJobSeekerDetails(List<JobSeekerDetails> jobSeekerDetails) {
		this.jobSeekerDetails = jobSeekerDetails;
	}

	@Override
	public String toString() {
		return "JobSeekerDetailsResponse [jobSeekerDetails=" + jobSeekerDetails + "]";
	}
}