package com.recruiter.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "m_degree", schema = "job_search")
public class DegreeMasterEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "degree_id")
	private Integer degreeId;
	@Column(name = "degree")
	private String degree;
	@Column(name = "degree_description")
	private String degreeDescription;

}