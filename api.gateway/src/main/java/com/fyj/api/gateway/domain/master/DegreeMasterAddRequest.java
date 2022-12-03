package com.fyj.api.gateway.domain.master;

import java.io.Serializable;

import com.fyj.api.gateway.common.CommonServiceRequest;

import lombok.Data;

@Data
public class DegreeMasterAddRequest extends CommonServiceRequest implements Serializable{

	private static final long serialVersionUID = 1L;
	private String degree;
	private String degreeDescription;
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