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
@Table(name = "user_details", schema = "job_search")
public class UserDetailsEntity {

	@Id
	@Column(name = "user_id")
	private BigInteger userId;
	@Column(name = "user_role_id")
	private String userRoleId;
	@Column(name = "skills")
	private String skills;
	@Column(name = "profile_summary")
	private String profileSummary;
	@Column(name = "address")
	private String address;
	@Column(name = "pin_code")
	private String pinCode;
	@Column(name = "home_town")
	private String homeTown;
	@Column(name = "date_of_birth")
	private Date dateOfBirth;
	@Column(name = "gender")
	private String gender;
	@Column(name = "martial_status")
	private String martialStatus;
	public BigInteger getUserId() {
		return userId;
	}
	public void setUserId(BigInteger userId) {
		this.userId = userId;
	}
	public String getUserRoleId() {
		return userRoleId;
	}
	public void setUserRoleId(String userRoleId) {
		this.userRoleId = userRoleId;
	}
	public String getSkills() {
		return skills;
	}
	public void setSkills(String skills) {
		this.skills = skills;
	}
	public String getProfileSummary() {
		return profileSummary;
	}
	public void setProfileSummary(String profileSummary) {
		this.profileSummary = profileSummary;
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
	public String getHomeTown() {
		return homeTown;
	}
	public void setHomeTown(String homeTown) {
		this.homeTown = homeTown;
	}
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMartialStatus() {
		return martialStatus;
	}
	public void setMartialStatus(String martialStatus) {
		this.martialStatus = martialStatus;
	}

}