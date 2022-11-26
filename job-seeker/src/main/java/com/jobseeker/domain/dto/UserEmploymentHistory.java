package com.jobseeker.domain.dto;

import java.util.Date;

import lombok.Data;

@Data
public class UserEmploymentHistory {

	private Integer userEmploymentHistoryId;
	private String firstName;
	private String lastName;
	private String designation;
	private String employer;
	private Date jobStartDate;
	private Date jobEndDate;
	private String currentActiveJob;
	private String jobRole;

	public Integer getUserEmploymentHistoryId() {
		return userEmploymentHistoryId;
	}

	public void setUserEmploymentHistoryId(Integer userEmploymentHistoryId) {
		this.userEmploymentHistoryId = userEmploymentHistoryId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getEmployer() {
		return employer;
	}

	public void setEmployer(String employer) {
		this.employer = employer;
	}

	public Date getJobStartDate() {
		return jobStartDate;
	}

	public void setJobStartDate(Date jobStartDate) {
		this.jobStartDate = jobStartDate;
	}

	public Date getJobEndDate() {
		return jobEndDate;
	}

	public void setJobEndDate(Date jobEndDate) {
		this.jobEndDate = jobEndDate;
	}

	public String getCurrentActiveJob() {
		return currentActiveJob;
	}

	public void setCurrentActiveJob(String currentActiveJob) {
		this.currentActiveJob = currentActiveJob;
	}

	public String getJobRole() {
		return jobRole;
	}

	public void setJobRole(String jobRole) {
		this.jobRole = jobRole;
	}

}