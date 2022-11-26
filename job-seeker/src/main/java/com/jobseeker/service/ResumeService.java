package com.jobseeker.service;

import java.math.BigInteger;

import javax.validation.Valid;

import org.springframework.web.multipart.MultipartFile;

import com.jobseeker.common.CommonServiceRequest;
import com.jobseeker.common.CommonServiceResponse;
import com.jobseeker.domain.resume.EducationDetailsEditRequest;
import com.jobseeker.domain.resume.EducationDetailsRequest;
import com.jobseeker.domain.resume.EducationDetailsResponse;
import com.jobseeker.domain.resume.EmploymentHistoryEditRequest;
import com.jobseeker.domain.resume.EmploymentHistoryRequest;
import com.jobseeker.domain.resume.EmploymentHistoryResponse;
import com.jobseeker.domain.resume.MainSkillsEditRequest;
import com.jobseeker.domain.resume.MainSkillsRequest;
import com.jobseeker.domain.resume.MainSkillsResponse;
import com.jobseeker.domain.resume.ProjectHistoryEditRequest;
import com.jobseeker.domain.resume.ProjectHistoryResponse;
import com.jobseeker.domain.resume.ResumeResponse;

public interface ResumeService {

	public CommonServiceResponse addSkillsAndGeneralDetails(MainSkillsRequest mainSkillsRequest);

	public CommonServiceResponse addUserEducationDetails(EducationDetailsRequest educationDetailsRequest);

	public CommonServiceResponse addUserEmploymentHistory(EmploymentHistoryRequest employmentHistoryRequest);

	public MainSkillsResponse getMainSkills(@Valid CommonServiceRequest commonServiceRequest);
	
	public EducationDetailsResponse getUserEductaionDetails(@Valid CommonServiceRequest commonServiceRequest);
	
	public EmploymentHistoryResponse getUserEmploymentHistory(@Valid CommonServiceRequest commonServiceRequest);
	
	public CommonServiceResponse editSkillsAndGeneralDetails(MainSkillsEditRequest mainSkillsRequest);

	public CommonServiceResponse editUserEducationDetails(EducationDetailsEditRequest educationDetailsRequest);

	public CommonServiceResponse editUserEmploymentHistory(EmploymentHistoryEditRequest employmentHistoryRequest);
	
	public ProjectHistoryResponse getProjectHisoryForAEmployment(ProjectHistoryEditRequest projectHistoryEditRequest);
	
	public CommonServiceResponse editProjectHisory(ProjectHistoryEditRequest projectHistoryEditRequest);
	
	public CommonServiceResponse uploadResume(MultipartFile resume, String loginId);
	
	public ResumeResponse downloadResume(BigInteger userId);
	
}
