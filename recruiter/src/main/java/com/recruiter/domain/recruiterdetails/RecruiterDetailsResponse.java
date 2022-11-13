package com.recruiter.domain.recruiterdetails;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.recruiter.common.CommonServiceResponse;
import com.recruiter.entity.CompanyJobsAndDetailsEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class RecruiterDetailsResponse extends CommonServiceResponse implements Serializable {
	public static final long serialVersionUID = 1L;

	private String firstName;
	private String lastName;
	private String email;
	private String mobileNumber;
	private String active;
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
	@Override
	public String toString() {
		return "RecruiterDetailsResponse [firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
				+ ", mobileNumber=" + mobileNumber + ", active=" + active + "]";
	}
}