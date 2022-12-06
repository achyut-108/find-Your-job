package com.jobseeker.domain.master;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.jobseeker.common.CommonServiceResponse;
import com.jobseeker.entity.CompanyMasterEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class CompanyMasterResponse extends CommonServiceResponse implements Serializable {
	public static final long serialVersionUID = 1L;
	
	private List<CompanyMasterEntity> companyDetails;

	public List<CompanyMasterEntity> getCompanyDetails() {
		return companyDetails;
	}

	public void setCompanyDetails(List<CompanyMasterEntity> companyDetails) {
		this.companyDetails = companyDetails;
	}
}