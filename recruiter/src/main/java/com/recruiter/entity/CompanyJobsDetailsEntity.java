package com.recruiter.entity;

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
@Table(name = "company_job_details", schema = "job_search")
public class CompanyJobsDetailsEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "job_details_id")
	private BigInteger jobDetailsId;
	@Column(name = "job_id")
	private BigInteger jobId;
	@Column(name = "salary_per_hour")
	private Integer salaryPerHour;
	@Column(name = "skills_required")
	private String skillsRequired;
	@Column(name = "active")
	private String active;
	@Column(name = "job_location")
	private String jobLocation;
	@Column(name = "creation_date")
	private Date jobCreationDate;
	@Column(name = "end_date")
	private Date endDate;
	@Column(name = "ctc_offered")
	private Integer ctcOffered;
}