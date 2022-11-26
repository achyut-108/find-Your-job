package com.jobseeker.entity;

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
@Table(name = "job_application_history", schema = "job_search")
public class JobApplicationHistoryEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "job_application_id")
	private BigInteger jobApplicationId;
	@Column(name = "job_id")
	private BigInteger jobId;
	@Column(name = "job_seeker_id")
	private BigInteger jobSeekerId;
	@Column(name = "active")
	private String active;
	@Column(name = "creation_date")
	private Date creationDate;
	@Column(name = "application_accepted")
	private String applicataionAccepted;
	@Column(name = "application_viewed")
	private String applicationViewed;
	
	public String getApplicataionAccepted() {
		return applicataionAccepted;
	}
	public void setApplicataionAccepted(String applicataionAccepted) {
		this.applicataionAccepted = applicataionAccepted;
	}
	public String getApplicationViewed() {
		return applicationViewed;
	}
	public void setApplicationViewed(String applicationViewed) {
		this.applicationViewed = applicationViewed;
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
	public BigInteger getJobSeekerId() {
		return jobSeekerId;
	}
	public void setJobSeekerId(BigInteger jobSeekerId) {
		this.jobSeekerId = jobSeekerId;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	@Override
	public String toString() {
		return "JobApplicationHistoryEntity [jobApplicationId=" + jobApplicationId + ", jobId=" + jobId
				+ ", jobSeekerId=" + jobSeekerId + ", active=" + active + ", creationDate=" + creationDate + "]";
	}
}