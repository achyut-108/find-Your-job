package com.recruiter.entity;

import java.math.BigInteger;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;
import lombok.ToString;

@Data
@Entity
@Table(name = "company_jobs", schema = "job_search")
@ToString
public class CompanyJobsAndDetailsEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "job_id")
	private BigInteger jobId;
	@Column(name = "company_id")
	private Integer companyId;
	@Transient
	private String companyName;//not part of the table
	@Transient
	private String companyDescription; //not part of the table
	@Column(name = "job_title")
	private String jobTitle;
	@Column(name = "job_description")
	private String jobDescription;
	@Column(name = "job_type_id")
	private Integer jobTypeId;
	@Transient
	private String jobType;
	@Column(name = "active")
	private String active;
//	@OneToOne(cascade = CascadeType.ALL)
//    @JoinColumn(name = "job_details", referencedColumnName = "job_id")
	@OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "jobId")
    private CompanyJobsDetailsEntity companyJobDetailsEntity;
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
	public CompanyJobsDetailsEntity getCompanyJobDetailsEntity() {
		return companyJobDetailsEntity;
	}
	public void setCompanyJobDetailsEntity(CompanyJobsDetailsEntity companyJobDetailsEntity) {
		this.companyJobDetailsEntity = companyJobDetailsEntity;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyDescription() {
		return companyDescription;
	}
	public void setCompanyDescription(String companyDescription) {
		this.companyDescription = companyDescription;
	}
	
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	@Override
	public String toString() {
		return "CompanyJobsAndDetailsEntity [jobId=" + jobId + ", companyId=" + companyId + ", companyName="
				+ companyName + ", companyDescription=" + companyDescription + ", jobTitle=" + jobTitle
				+ ", jobDescription=" + jobDescription + ", jobTypeId=" + jobTypeId + ", jobType=" + jobType
				+ ", active=" + active + ", companyJobDetailsEntity=" + companyJobDetailsEntity + "]";
	}	
}