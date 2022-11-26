package com.jobseeker.domain.master;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.jobseeker.common.CommonServiceResponse;
import com.jobseeker.entity.InstitutionMasterEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class InstitutionMasterResponse extends CommonServiceResponse implements Serializable {
	public static final long serialVersionUID = 1L;
	
	private List<InstitutionMasterEntity> institutionDetails;

	public List<InstitutionMasterEntity> getInstitutionDetails() {
		return institutionDetails;
	}

	public void setInstitutionDetails(List<InstitutionMasterEntity> institutionDetails) {
		this.institutionDetails = institutionDetails;
	}
}