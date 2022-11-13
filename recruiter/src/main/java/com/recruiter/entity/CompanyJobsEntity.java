package com.recruiter.entity;

import java.math.BigInteger;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "company_jobs", schema = "job_search")
public class CompanyJobsEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "job_id")
	private BigInteger jobId;
	@Column(name = "company_id")
	private Integer companyId;
	@Column(name = "job_title")
	private String jobTitle;
	@Column(name = "job_description")
	private String jobDescription;
	@Column(name = "job_type_id")
	private Integer jobTypeId;
	@Column(name = "active")
	private String active;
	public BigInteger getJobId() {
		return jobId;
	}
	public void setJobId(BigInteger jobId) {
		this.jobId = jobId;
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
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	@Override
	public String toString() {
		return "CompanyJobsEntity [jobId=" + jobId + ", companyId=" + companyId + ", jobTitle=" + jobTitle
				+ ", jobDescription=" + jobDescription + ", jobTypeId=" + jobTypeId + ", active=" + active + "]";
	}
}