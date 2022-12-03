package com.fyj.api.gateway.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "m_job_type", schema = "job_search")
public class JobTypeMasterEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "job_type_id")
	private Integer jobTypeId;
	@Column(name = "job_type")
	private String jobType;
	@Column(name = "job_type_description")
	private String jobTypeDescription;
	public Integer getJobTypeId() {
		return jobTypeId;
	}
	public void setJobTypeId(Integer jobTypeId) {
		this.jobTypeId = jobTypeId;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getJobTypeDescription() {
		return jobTypeDescription;
	}
	public void setJobTypeDescription(String jobTypeDescription) {
		this.jobTypeDescription = jobTypeDescription;
	}
}