package com.jobseeker.domain.resume;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.jobseeker.common.CommonServiceResponse;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class ProjectHistoryResponse extends CommonServiceResponse implements Serializable {
	public static final long serialVersionUID = 1L;

	private List<ProjectHistory> projectHistories;

	public List<ProjectHistory> getProjectHistories() {
		return projectHistories;
	}

	public void setProjectHistories(List<ProjectHistory> projectHistories) {
		this.projectHistories = projectHistories;
	}
}