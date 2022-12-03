package com.fyj.api.gateway.entity;

import java.math.BigInteger;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "company_jobs", schema = "job_search")
public class CompanyJobsEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "job_id")
	private BigInteger jobId;
	@Column(name = "company_id")
	private Integer companyId;
	@Column(name = "job_title")
	private String jobTitle;
	@Column(name = "job_description")
	private String jobDescription;
	@Column(name = "job_type_id")
	private Integer jobTypeId;
	@Column(name = "active")
	private String active;
}