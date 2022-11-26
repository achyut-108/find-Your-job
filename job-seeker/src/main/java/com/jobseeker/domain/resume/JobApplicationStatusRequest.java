package com.jobseeker.domain.resume;

import java.io.Serializable;
import java.math.BigInteger;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.jobseeker.common.CommonServiceRequest;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
public class JobApplicationStatusRequest extends CommonServiceRequest implements Serializable {
	public static final long serialVersionUID = 1L;

	private BigInteger jobApplicationId;

	public BigInteger getJobApplicationId() {
		return jobApplicationId;
	}

	public void setJobApplicationId(BigInteger jobApplicationId) {
		this.jobApplicationId = jobApplicationId;
	}
	
}
