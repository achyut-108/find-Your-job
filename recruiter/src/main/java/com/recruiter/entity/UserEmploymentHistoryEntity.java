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
@Table(name = "user_employment_history", schema = "job_search")
public class UserEmploymentHistoryEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_employment_id")
	private Integer userEmploymentId;
	@Column(name = "user_id")
	private BigInteger userId;
	@Column(name = "designation")
	private String designation;
	@Column(name = "employer")
	private String employer;
	@Column(name = "start_date")
	private Date startDate;
	@Column(name = "end_date")
	private Date endDate;
	@Column(name = "active")
	private String active;
	@Column(name = "role")
	private String role;

}