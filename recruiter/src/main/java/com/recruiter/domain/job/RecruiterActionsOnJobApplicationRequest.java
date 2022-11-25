package com.recruiter.domain.job;

import java.io.Serializable;
import java.math.BigInteger;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.recruiter.common.BusinessConstants;
import com.recruiter.common.CommonServiceRequest;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
public class RecruiterActionsOnJobApplicationRequest extends CommonServiceRequest implements Serializable {
	public static final long serialVersionUID = 1L;

	private String applicationViewed;
	private String applicationAccepted;
	private BigInteger jobApplicationId;
	private BigInteger jobId;
	private BigInteger jobSeekerId;

	public BigInteger getJobSeekerId() {
		return jobSeekerId;
	}

	public void setJobSeekerId(BigInteger jobSeekerId) {
		this.jobSeekerId = jobSeekerId;
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

	public boolean validApplicationAcceptedField() {
		return this.applicationAccepted.equalsIgnoreCase(BusinessConstants.ACCEPTED)
				|| this.applicationAccepted.equalsIgnoreCase(BusinessConstants.REJECTED);
	}
}
