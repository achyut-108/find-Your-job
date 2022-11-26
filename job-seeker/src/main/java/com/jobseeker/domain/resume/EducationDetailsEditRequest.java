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
public class EducationDetailsEditRequest extends CommonServiceRequest implements Serializable {
	public static final long serialVersionUID = 1L;

	private Integer userEducationId;
	private Integer degreeId;
	private Integer institutionId;
	private String major;
	private Date startDate;
	private Date endDate;
	private String isHighest;
	
	public Integer getUserEducationId() {
		return userEducationId;
	}
	public void setUserEducationId(Integer userEducationId) {
		this.userEducationId = userEducationId;
	}
	public Integer getDegreeId() {
		return degreeId;
	}
	public void setDegreeId(Integer degreeId) {
		this.degreeId = degreeId;
	}
	public Integer getInstitutionId() {
		return institutionId;
	}
	public void setInstitutionId(Integer institutionId) {
		this.institutionId = institutionId;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
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
	public String getIsHighest() {
		return isHighest;
	}
	public void setIsHighest(String isHighest) {
		this.isHighest = isHighest;
	}
}
