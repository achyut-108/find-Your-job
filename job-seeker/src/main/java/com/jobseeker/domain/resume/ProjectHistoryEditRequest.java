package com.jobseeker.domain.resume;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.jobseeker.common.CommonServiceRequest;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
public class ProjectHistoryEditRequest extends CommonServiceRequest implements Serializable {
	public static final long serialVersionUID = 1L;

	private Date startDate;
	private Date endDate;
	private String projectName;
	private String projectDescription;
	private BigInteger projectId;
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
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
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
}
