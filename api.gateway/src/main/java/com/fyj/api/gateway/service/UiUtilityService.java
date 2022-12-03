package com.fyj.api.gateway.service;

import com.fyj.api.gateway.domain.master.DegreeMasterResponse;
import com.fyj.api.gateway.domain.master.InstitutionMasterResponse;
import com.fyj.api.gateway.domain.master.JobTypeResponse;

public interface UiUtilityService {

	public DegreeMasterResponse getAllDegreeDetails();

	public InstitutionMasterResponse getAllInstitutionDetails();
	
	public JobTypeResponse getAllJobTypeDetails();
}
