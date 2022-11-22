package com.jobseeker.service;

import javax.validation.Valid;

import com.jobseeker.common.CommonServiceRequest;
import com.jobseeker.common.CommonServiceResponse;
import com.jobseeker.domain.resume.EducationDetailsRequest;
import com.jobseeker.domain.resume.EducationDetailsResponse;
import com.jobseeker.domain.resume.EmploymentHistoryRequest;
import com.jobseeker.domain.resume.EmploymentHistoryResponse;
import com.jobseeker.domain.resume.MainSkillsRequest;
import com.jobseeker.domain.resume.MainSkillsResponse;

public interface ResumeService {

	public CommonServiceResponse addSkillsAndGeneralDetails(MainSkillsRequest mainSkillsRequest);

	public CommonServiceResponse addUserEducationDetails(EducationDetailsRequest educationDetailsRequest);

	public CommonServiceResponse addUserEmploymentHistory(EmploymentHistoryRequest employmentHistoryRequest);

	public MainSkillsResponse getMainSkills(@Valid CommonServiceRequest commonServiceRequest);
	
	public EducationDetailsResponse getUserEductaionDetails(@Valid CommonServiceRequest commonServiceRequest);
	
	public EmploymentHistoryResponse getUserEmploymentHistory(@Valid CommonServiceRequest commonServiceRequest);
	
}
