package com.recruiter.domain.resume;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.recruiter.common.CommonServiceRequest;
import com.recruiter.entity.UserProjectHistoryEntity;
import com.sun.istack.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
public class EmploymentHistoryRequest extends CommonServiceRequest implements Serializable {
	public static final long serialVersionUID = 1L;

	@NotNull
	private String designation;
	@NotNull
	private String employer;
	@NotNull
	private Date startDate;
	@NotNull
	private Date endDate;
	@NotNull
	@Size(max = 1, min = 1)
	private String active;
	@NotNull
	private String role;
	@NotEmpty
	List<ProjectHistoryRequest> projectDetails;
	
}
