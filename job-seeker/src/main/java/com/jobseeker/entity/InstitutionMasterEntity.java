package com.jobseeker.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "m_institution", schema = "job_search")
public class InstitutionMasterEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "institution_id")
	private Integer institutionId;
	@Column(name = "institution_name")
	private String institutionName;
	@Column(name = "address")
	private String address;
	@Column(name = "pin_code")
	private String pinCode;
	@Column(name = "location")
	private String location;

}