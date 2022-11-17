package com.jobseeker.domain.jobapply;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonAutoDetect;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class JobApplicationDetails implements Serializable {
	public static final long serialVersionUID = 1L;

	private BigInteger jobId;
	private Date appliedDate;
	private Integer companyId;
	private String CompanyName;
	private String companyDescription;
	private String jobTitle;
	private String jobDescription;
	private Integer jobTypeId;
	private String jobType;
	private String active;

	public BigInteger getJobId() {
		return jobId;
	}

	public void setJobId(BigInteger jobId) {
		this.jobId = jobId;
	}

	public Date getAppliedDate() {
		return appliedDate;
	}

	public void setAppliedDate(Date appliedDate) {
		this.appliedDate = appliedDate;
	}

	public String getCompanyName() {
		return CompanyName;
	}

	public void setCompanyName(String companyName) {
		CompanyName = companyName;
	}

	public String getCompanyDescription() {
		return companyDescription;
	}

	public void setCompanyDescription(String companyDescription) {
		this.companyDescription = companyDescription;
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

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public Integer getJobTypeId() {
		return jobTypeId;
	}

	public void setJobTypeId(Integer jobTypeId) {
		this.jobTypeId = jobTypeId;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	
	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	@Override
	public String toString() {
		return "JobApplicationDetails [jobId=" + jobId + ", appliedDate=" + appliedDate + ", companyId=" + companyId
				+ ", CompanyName=" + CompanyName + ", companyDescription=" + companyDescription + ", jobTitle="
				+ jobTitle + ", jobDescription=" + jobDescription + ", jobTypeId=" + jobTypeId + ", jobType=" + jobType
				+ ", active=" + active + "]";
	}
}