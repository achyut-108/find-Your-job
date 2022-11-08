package com.jobseeker.entity;

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
@Table(name = "m_company", schema = "job_search")
public class CompanyMasterEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "company_id")
	private Integer companyId;
	@Column(name = "company_name")
	private String companyName;
	@Column(name = "company_description")
	private String companyDescription;
	@Column(name = "user_id")
	private BigInteger userId;

}