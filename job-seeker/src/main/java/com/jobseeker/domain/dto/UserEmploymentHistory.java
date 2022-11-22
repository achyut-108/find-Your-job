package com.jobseeker.domain.dto;

import java.util.Date;

import lombok.Data;

@Data
public class UserEmploymentHistory {

	private String firstName;
	private String lastName;
	private String designation;
	private String employer;
	private Date jobStartDate;
	private Date jobEndDate;
	private String currentActiveJob;
	private String jobRole;
	private String projectName;
	private String projectDescription;
	private Date projectStartDate;
	private Date projectEndDate;
	
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
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getProjectDescription() {
		return projectDescription;
	}
	public void setProjectDescription(String projectDescription) {
		this.projectDescription = projectDescription;
	}
	public Date getProjectStartDate() {
		return projectStartDate;
	}
	public void setProjectStartDate(Date projectStartDate) {
		this.projectStartDate = projectStartDate;
	}
	public Date getProjectEndDate() {
		return projectEndDate;
	}
	public void setProjectEndDate(Date projectEndDate) {
		this.projectEndDate = projectEndDate;
	}
	
}