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
	public Integer getDegreeId() {
		return degreeId;
	}
	public void setDegreeId(Integer degreeId) {
		this.degreeId = degreeId;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getDegreeDescription() {
		return degreeDescription;
	}
	public void setDegreeDescription(String degreeDescription) {
		this.degreeDescription = degreeDescription;
	}
}