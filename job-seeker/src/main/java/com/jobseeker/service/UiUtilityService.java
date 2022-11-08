package com.jobseeker.service;

import com.jobseeker.domain.master.DegreeMasterResponse;
import com.jobseeker.domain.master.InstitutionMasterResponse;
import com.jobseeker.domain.master.JobTypeResponse;

public interface UiUtilityService {

	public DegreeMasterResponse getAllDegreeDetails();

	public InstitutionMasterResponse getAllInstitutionDetails();
	
	public JobTypeResponse getAllJobTypeDetails();
}
