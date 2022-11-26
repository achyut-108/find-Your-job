package com.jobseeker.domain.resume;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonAutoDetect;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class ProjectHistory implements Serializable {
	public static final long serialVersionUID = 1L;

	private BigInteger projectId;
	private String projectName;
	private String projectDescription;
	private Date projectStartDate;
	private Date projectEndDate;
	private Integer employmentId;
	
	public Integer getEmploymentId() {
		return employmentId;
	}
	public void setEmploymentId(Integer employmentId) {
		this.employmentId = employmentId;
	}
	public BigInteger getProjectId() {
		return projectId;
	}
	public void setProjectId(BigInteger projectId) {
		this.projectId = projectId;
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