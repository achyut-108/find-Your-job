package com.recruiter.domain.job;

import java.io.Serializable;
import java.math.BigInteger;

import com.fasterxml.jackson.annotation.JsonAutoDetect;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class JobSeekerDetails implements Serializable {
	public static final long serialVersionUID = 1L;
	
	private String email;
	private String mobileNumber;
	private String firstName;
	private String lastName;
	private BigInteger jobSeekerId;
	
	public BigInteger getJobSeekerId() {
		return jobSeekerId;
	}
	public void setJobSeekerId(BigInteger jobSeekerId) {
		this.jobSeekerId = jobSeekerId;
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
	@Override
	public String toString() {
		return "JobSeekerDetails [email=" + email + ", mobileNumber=" + mobileNumber + ", firstName=" + firstName
				+ ", lastName=" + lastName + "]";
	}
}