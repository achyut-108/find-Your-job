package com.recruiter.service;

import com.recruiter.domain.master.DegreeMasterResponse;
import com.recruiter.domain.master.InstitutionMasterResponse;
import com.recruiter.domain.master.JobTypeResponse;

public interface UiUtilityService {

	public DegreeMasterResponse getAllDegreeDetails();

	public InstitutionMasterResponse getAllInstitutionDetails();
	
	public JobTypeResponse getAllJobTypeDetails();
}
