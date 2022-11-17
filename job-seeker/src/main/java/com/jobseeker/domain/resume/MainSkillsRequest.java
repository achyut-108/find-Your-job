package com.jobseeker.domain.resume;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.jobseeker.common.CommonServiceRequest;
import com.sun.istack.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper=false)
@AllArgsConstructor
@NoArgsConstructor
public class MainSkillsRequest extends CommonServiceRequest implements Serializable{
	public static final long serialVersionUID = 1L;
	
	@NotNull
	private String[] skills;
	@NotNull
	private String profileSummary;
	@NotNull
	private String address;
	@NotNull
	private String pinCode;
	@NotNull
	private String homeTown;
	@NotNull
	private Date dateOfBirth;
	@NotNull
	private String gender;
	@NotNull
	private String martialStatus;
	public String[] getSkills() {
		return skills;
	}
	public void setSkills(String[] skills) {
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
