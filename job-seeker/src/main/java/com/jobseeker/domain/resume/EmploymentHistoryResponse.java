package com.jobseeker.domain.resume;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.jobseeker.common.CommonServiceResponse;
import com.jobseeker.domain.dto.UserEmploymentHistory;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class EmploymentHistoryResponse extends CommonServiceResponse implements Serializable {
	public static final long serialVersionUID = 1L;

	private List<UserEmploymentHistory> employmentDetails;

	public List<UserEmploymentHistory> getEmploymentDetails() {
		return employmentDetails;
	}

	public void setEmploymentDetails(List<UserEmploymentHistory> employmentDetails) {
		this.employmentDetails = employmentDetails;
	}
}