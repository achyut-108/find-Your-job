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
	private String jobTitle;
	@NotNull
	private String jobDescription;
	@NotNull
	private Integer jobTypeId;
	@NotNull
	@Size(min=1,max=1)
	private String active;
	private Integer salaryPerHour;
	private String[] skillsRequired;
	@NotNull
	private String jobLocation;
	private Integer ctcOffered;
	@NotNull
	private boolean editJob;
	private BigInteger jobId;
}
