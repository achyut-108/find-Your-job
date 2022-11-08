package com.fyj.service;

import com.fyj.domain.resume.EducationDetailsRequest;
import com.fyj.domain.resume.EducationDetailsResponse;
import com.fyj.domain.resume.EmploymentHistoryRequest;
import com.fyj.domain.resume.EmploymentHistoryResponse;
import com.fyj.domain.resume.MainSkillsRequest;
import com.fyj.domain.resume.MainSkillsResponse;

public interface ResumeService {

	public MainSkillsResponse addSkillsAndGeneralDetails(MainSkillsRequest mainSkillsRequest);

	public EducationDetailsResponse addUserEducationDetails(EducationDetailsRequest educationDetailsRequest);

	public EmploymentHistoryResponse addUserEmploymentHistory(EmploymentHistoryRequest employmentHistoryRequest);
}
