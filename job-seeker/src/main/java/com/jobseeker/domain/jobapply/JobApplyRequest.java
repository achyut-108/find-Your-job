package com.jobseeker.domain.jobapply;

import java.io.Serializable;
import java.math.BigInteger;

import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.jobseeker.common.CommonServiceRequest;
import com.sun.istack.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper=false)
@AllArgsConstructor
@NoArgsConstructor
public class JobApplyRequest extends CommonServiceRequest implements Serializable{
	public static final long serialVersionUID = 1L;
	
	@NotNull
	private BigInteger jobId;

	public BigInteger getJobId() {
		return jobId;
	}

	public void setJobId(BigInteger jobId) {
		this.jobId = jobId;
	}
}
