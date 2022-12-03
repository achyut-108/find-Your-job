package com.jobseeker.domain.dto;

import java.io.Serializable;
import java.util.Date;

public class UserEducationHistory implements Serializable {

	private static final long serialVersionUID = 1L;
	private String firstName;
	private String lastName;
	private String major;
	private Date startDate;
	private Date endDate;
	private String isHighestEducaton;
	private String degree;
	private String degreeDescription;
	private String institutionName;
	private String address;
	private String pinCode;
	private String location;
	private Integer userEducationHistoryId;

	public Integer getUserEducationHistoryId() {
		return userEducationHistoryId;
	}

	public void setUserEducationHistoryId(Integer userEducationHistoryId) {
		this.userEducationHistoryId = userEducationHistoryId;
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

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getDegreeDescription() {
		return degreeDescription;
	}

	public void setDegreeDescription(String degreeDescription) {
		this.degreeDescription = degreeDescription;
	}

	public String getInstitutionName() {
		return institutionName;
	}

	public void setInstitutionName(String institutionName) {
		this.institutionName = institutionName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPinCode() {
		return pinCode;
	}

	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "UserEducationHistoryEntity [firstName=" + firstName + ", lastName=" + lastName + ", major=" + major
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", isHighestEducaton=" + isHighestEducaton
				+ ", degree=" + degree + ", degreeDescription=" + degreeDescription + ", institutionName="
				+ institutionName + ", address=" + address + ", pinCode=" + pinCode + ", location=" + location + "]";
	}
}