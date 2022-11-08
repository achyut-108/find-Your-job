package com.fyj.service;

import com.fyj.domain.master.DegreeMasterResponse;
import com.fyj.domain.master.InstitutionMasterResponse;
import com.fyj.domain.master.JobTypeResponse;

public interface UiUtilityService {

	public DegreeMasterResponse getAllDegreeDetails();

	public InstitutionMasterResponse getAllInstitutionDetails();
	
	public JobTypeResponse getAllJobTypeDetails();
}
