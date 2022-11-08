package com.jobseeker.entity;

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
@Table(name = "user_education_history", schema = "job_search")
public class UserEducationHistoryEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "user_education_id")
	private Integer userEducationId;
	@Column(name = "user_id")
	private BigInteger userId;
	@Column(name = "degree_id")
	private Integer degreeId;
	@Column(name = "institution_id")
	private Integer institutionId;
	@Column(name = "major")
	private String major;
	@Column(name = "start_date")
	private Date startDate;
	@Column(name = "end_date")
	private Date endDate;
	@Column(name = "is_highest")
	private String isHighestEducaton;

}