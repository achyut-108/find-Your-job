package com.jobseeker.domain.resume;

import java.io.Serializable;
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
public class EmploymentHistoryEditRequest extends CommonServiceRequest implements Serializable {
	public static final long serialVersionUID = 1L;

	private String designation;
	private String employer;
	private Date startDate;
	private Date endDate;
	private String active;
	private String role;
	private Integer userEmploymentHistoryId;
	
	public Integer getUserEmploymentHistoryId() {
		return userEmploymentHistoryId;
	}
	public void setUserEmploymentHistoryId(Integer userEmploymentHistoryId) {
		this.userEmploymentHistoryId = userEmploymentHistoryId;
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
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
}
