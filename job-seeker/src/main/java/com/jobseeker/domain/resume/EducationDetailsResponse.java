package com.jobseeker.domain.resume;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.jobseeker.common.CommonServiceResponse;
import com.jobseeker.domain.dto.UserEducationHistory;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class EducationDetailsResponse extends CommonServiceResponse implements Serializable {
	public static final long serialVersionUID = 1L;
	
	private List<UserEducationHistory> educationDetails;

	public List<UserEducationHistory> getEducationDetails() {
		return educationDetails;
	}

	public void setEducationDetails(List<UserEducationHistory> educationDetails) {
		this.educationDetails = educationDetails;
	}
}