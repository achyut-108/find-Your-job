package com.jobseeker.domain.resume;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.jobseeker.common.CommonServiceResponse;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class MainSkillsResponse extends CommonServiceResponse implements Serializable {
	public static final long serialVersionUID = 1L;
	
	private String skills;

	public String getSkills() {
		return skills;
	}

	public void setSkills(String skills) {
		this.skills = skills;
	}
}