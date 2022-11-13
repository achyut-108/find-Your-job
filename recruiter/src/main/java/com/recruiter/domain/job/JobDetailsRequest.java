package com.recruiter.domain.job;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Arrays;

import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.recruiter.common.CommonServiceRequest;
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
public class JobDetailsRequest extends CommonServiceRequest implements Serializable{
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
	public Integer getSalaryPerHour() {
		return salaryPerHour;
	}
	public void setSalaryPerHour(Integer salaryPerHour) {
		this.salaryPerHour = salaryPerHour;
	}
	public String[] getSkillsRequired() {
		return skillsRequired;
	}
	public void setSkillsRequired(String[] skillsRequired) {
		this.skillsRequired = skillsRequired;
	}
	public String getJobLocation() {
		return jobLocation;
	}
	public void setJobLocation(String jobLocation) {
		this.jobLocation = jobLocation;
	}
	public Integer getCtcOffered() {
		return ctcOffered;
	}
	public void setCtcOffered(Integer ctcOffered) {
		this.ctcOffered = ctcOffered;
	}
	public boolean isEditJob() {
		return editJob;
	}
	public void setEditJob(boolean editJob) {
		this.editJob = editJob;
	}
	public BigInteger getJobId() {
		return jobId;
	}
	public void setJobId(BigInteger jobId) {
		this.jobId = jobId;
	}
	@Override
	public String toString() {
		return "JobDetailsRequest [jobTitle=" + jobTitle + ", jobDescription=" + jobDescription + ", jobTypeId="
				+ jobTypeId + ", active=" + active + ", salaryPerHour=" + salaryPerHour + ", skillsRequired="
				+ Arrays.toString(skillsRequired) + ", jobLocation=" + jobLocation + ", ctcOffered=" + ctcOffered
				+ ", editJob=" + editJob + ", jobId=" + jobId + "]";
	}
	
}
