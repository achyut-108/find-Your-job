package com.fyj.api.gateway.domain.master;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import com.fyj.api.gateway.common.CommonServiceRequest;

import lombok.Data;

@Data
public class CompanyMasterAddRequest extends CommonServiceRequest implements Serializable{

	private static final long serialVersionUID = 1L;
	@NotNull
	private String companyName;
	private String companyDescription;
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyDescription() {
		return companyDescription;
	}
	public void setCompanyDescription(String companyDescription) {
		this.companyDescription = companyDescription;
	}
}