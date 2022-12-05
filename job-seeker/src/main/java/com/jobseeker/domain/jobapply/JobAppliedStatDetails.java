package com.jobseeker.domain.jobapply;

import java.io.Serializable;
import java.math.BigInteger;

import com.fasterxml.jackson.annotation.JsonAutoDetect;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class JobAppliedStatDetails implements Serializable {
	public static final long serialVersionUID = 1L;

	private BigInteger jobId;
	private Integer countOfJobSeekers;
	private Integer companyId;
	private String jobTitle;
	private String jobDescription;
	private Integer jobTypeId;
	private Integer jobPostedBy;
	private String jobType;
	
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public BigInteger getJobId() {
		return jobId;
	}
	public void setJobId(BigInteger jobId) {
		this.jobId = jobId;
	}
	public Integer getCountOfJobSeekers() {
		return countOfJobSeekers;
	}
	public void setCountOfJobSeekers(Integer countOfJobSeekers) {
		this.countOfJobSeekers = countOfJobSeekers;
	}
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String getJobDescription() {
		return jobDescription;
	}
	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}
	public Integer getJobTypeId() {
		return jobTypeId;
	}
	public void setJobTypeId(Integer jobTypeId) {
		this.jobTypeId = jobTypeId;
	}
	public Integer getJobPostedBy() {
		return jobPostedBy;
	}
	public void setJobPostedBy(Integer jobPostedBy) {
		this.jobPostedBy = jobPostedBy;
	}
}