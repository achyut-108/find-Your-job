package com.recruiter.domain.recruiterdetails;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.recruiter.common.CommonServiceResponse;
import com.recruiter.entity.CompanyJobsAndDetailsEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class RecruiterJobDetailsResponse extends CommonServiceResponse implements Serializable {
	public static final long serialVersionUID = 1L;

	private String firstName;
	private String lastName;
	private String email;
	private String mobileNumber;
	private String active;
	private String userType;
	
	private List<CompanyJobsAndDetailsEntity> companyjobsAndDetailsList;

	public List<CompanyJobsAndDetailsEntity> getCompanyjobsAndDetailsList() {
		return companyjobsAndDetailsList;
	}

	public void setCompanyjobsAndDetailsList(List<CompanyJobsAndDetailsEntity> companyjobsAndDetailsList) {
		this.companyjobsAndDetailsList = companyjobsAndDetailsList;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}
	
}