package com.jobseeker.domain.resume;

import java.io.Serializable;
import java.math.BigInteger;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.jobseeker.common.CommonServiceResponse;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class JobApplicationStatusResponse extends CommonServiceResponse implements Serializable {
	public static final long serialVersionUID = 1L;

	private String applicationViewed;
	private String applicationAccepted;
	private BigInteger jobApplicationId;
	private BigInteger jobId;
	public String getApplicationViewed() {
		return applicationViewed;
	}
	public void setApplicationViewed(String applicationViewed) {
		this.applicationViewed = applicationViewed;
	}
	public String getApplicationAccepted() {
		return applicationAccepted;
	}
	public void setApplicationAccepted(String applicationAccepted) {
		this.applicationAccepted = applicationAccepted;
	}
	public BigInteger getJobApplicationId() {
		return jobApplicationId;
	}
	public void setJobApplicationId(BigInteger jobApplicationId) {
		this.jobApplicationId = jobApplicationId;
	}
	public BigInteger getJobId() {
		return jobId;
	}
	public void setJobId(BigInteger jobId) {
		this.jobId = jobId;
	}
	
}