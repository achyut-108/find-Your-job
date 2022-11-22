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
@Table(name = "user_education_history", schema = "job_search")
public class UserEducationHistoryEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_education_id")
	private Integer userEducationId;
	@Column(name = "user_id")
	private BigInteger userId;
	@Column(name = "degree_id")
	private Integer degreeId;
	@Column(name = "institution_id")
	private Integer institutionId;
	@Column(name = "major")
	private String major;
	@Column(name = "start_date")
	private Date startDate;
	@Column(name = "end_date")
	private Date endDate;
	@Column(name = "is_highest")
	private String isHighestEducaton;
	public Integer getUserEducationId() {
		return userEducationId;
	}
	public void setUserEducationId(Integer userEducationId) {
		this.userEducationId = userEducationId;
	}
	public BigInteger getUserId() {
		return userId;
	}
	public void setUserId(BigInteger userId) {
		this.userId = userId;
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
	public String getIsHighestEducaton() {
		return isHighestEducaton;
	}
	public void setIsHighestEducaton(String isHighestEducaton) {
		this.isHighestEducaton = isHighestEducaton;
	}
}