package com.recruiter.entity;

import java.math.BigInteger;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "company_job_details", schema = "job_search")
public class CompanyJobsDetailsEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "job_details_id")
	private BigInteger jobDetailsId;
	@Column(name = "job_id")
	private BigInteger jobId;
	@Column(name = "salary_per_hour")
	private Integer salaryPerHour;
	@Column(name = "skills_required")
	private String skillsRequired;
	@Column(name = "active")
	private String active;
	@Column(name = "job_location")
	private String jobLocation;
	@Column(name = "creation_date")
	private Date jobCreationDate;
	@Column(name = "end_date")
	private Date endDate;
	@Column(name = "ctc_offered")
	private Integer ctcOffered;
	public BigInteger getJobDetailsId() {
		return jobDetailsId;
	}
	public void setJobDetailsId(BigInteger jobDetailsId) {
		this.jobDetailsId = jobDetailsId;
	}
	public BigInteger getJobId() {
		return jobId;
	}
	public void setJobId(BigInteger jobId) {
		this.jobId = jobId;
	}
	public Integer getSalaryPerHour() {
		return salaryPerHour;
	}
	public void setSalaryPerHour(Integer salaryPerHour) {
		this.salaryPerHour = salaryPerHour;
	}
	public String getSkillsRequired() {
		return skillsRequired;
	}
	public void setSkillsRequired(String skillsRequired) {
		this.skillsRequired = skillsRequired;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	public String getJobLocation() {
		return jobLocation;
	}
	public void setJobLocation(String jobLocation) {
		this.jobLocation = jobLocation;
	}
	public Date getJobCreationDate() {
		return jobCreationDate;
	}
	public void setJobCreationDate(Date jobCreationDate) {
		this.jobCreationDate = jobCreationDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public Integer getCtcOffered() {
		return ctcOffered;
	}
	public void setCtcOffered(Integer ctcOffered) {
		this.ctcOffered = ctcOffered;
	}
	@Override
	public String toString() {
		return "CompanyJobsDetailsEntity [jobDetailsId=" + jobDetailsId + ", jobId=" + jobId + ", salaryPerHour="
				+ salaryPerHour + ", skillsRequired=" + skillsRequired + ", active=" + active + ", jobLocation="
				+ jobLocation + ", jobCreationDate=" + jobCreationDate + ", endDate=" + endDate + ", ctcOffered="
				+ ctcOffered + "]";
	}
}