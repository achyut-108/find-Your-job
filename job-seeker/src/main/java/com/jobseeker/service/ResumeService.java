package com.jobseeker.service;

import com.jobseeker.domain.resume.EducationDetailsRequest;
import com.jobseeker.domain.resume.EducationDetailsResponse;
import com.jobseeker.domain.resume.EmploymentHistoryRequest;
import com.jobseeker.domain.resume.EmploymentHistoryResponse;
import com.jobseeker.domain.resume.MainSkillsRequest;
import com.jobseeker.domain.resume.MainSkillsResponse;

public interface ResumeService {

	public MainSkillsResponse addSkillsAndGeneralDetails(MainSkillsRequest mainSkillsRequest);

	public EducationDetailsResponse addUserEducationDetails(EducationDetailsRequest educationDetailsRequest);

	public EmploymentHistoryResponse addUserEmploymentHistory(EmploymentHistoryRequest employmentHistoryRequest);
}
