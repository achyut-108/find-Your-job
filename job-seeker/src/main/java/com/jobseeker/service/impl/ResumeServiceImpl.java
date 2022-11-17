package com.jobseeker.service.impl;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobseeker.common.BusinessConstants;
import com.jobseeker.common.ErrorCodes;
import com.jobseeker.common.ValidationError;
import com.jobseeker.domain.resume.EducationDetailsRequest;
import com.jobseeker.domain.resume.EducationDetailsResponse;
import com.jobseeker.domain.resume.EmploymentHistoryRequest;
import com.jobseeker.domain.resume.EmploymentHistoryResponse;
import com.jobseeker.domain.resume.MainSkillsRequest;
import com.jobseeker.domain.resume.MainSkillsResponse;
import com.jobseeker.domain.resume.ProjectHistoryRequest;
import com.jobseeker.entity.UserDetailsEntity;
import com.jobseeker.entity.UserEducationHistoryEntity;
import com.jobseeker.entity.UserEmploymentHistoryEntity;
import com.jobseeker.entity.UserEntity;
import com.jobseeker.entity.UserProjectHistoryEntity;
import com.jobseeker.repo.UserDetailsRepository;
import com.jobseeker.repo.UserEducationHistoryRepository;
import com.jobseeker.repo.UserEmploymentHistoryRepository;
import com.jobseeker.repo.UserProjectHistoryRepository;
import com.jobseeker.repo.UserRepository;
import com.jobseeker.service.ResumeService;

@Service
public class ResumeServiceImpl implements ResumeService {

	@Autowired
	private UserDetailsRepository userDetailsRepository;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private UserEducationHistoryRepository userEducationHistoryRepository;
	@Autowired
	private UserEmploymentHistoryRepository userEmploymentHistoryRepository;
	@Autowired
	private UserProjectHistoryRepository userProjectHistoryRepository;

	public MainSkillsResponse addSkillsAndGeneralDetails(MainSkillsRequest mainSkillsRequest) {

		MainSkillsResponse mainSkillsResponse = new MainSkillsResponse();
		UserEntity userEntity = userRepository.findByLoginIdAndActive(mainSkillsRequest.getLoginId(),
				BusinessConstants.ACTIVE);

		if (Objects.isNull(userEntity)) {
			mainSkillsResponse.addValidationError(new ValidationError(ErrorCodes.INVALID_USER_ID.getCode(),
					ErrorCodes.INVALID_USER_ID.getDescription(), "loginId", mainSkillsRequest.getLoginId()));
			return mainSkillsResponse;
		}

		UserDetailsEntity userDetailsEntity = new UserDetailsEntity();
		userDetailsEntity.setUserId(userEntity.getUserId());
		userDetailsEntity.setAddress(mainSkillsRequest.getAddress());
		userDetailsEntity.setDateOfBirth(mainSkillsRequest.getDateOfBirth());
		userDetailsEntity.setGender(mainSkillsRequest.getGender());
		userDetailsEntity.setHomeTown(mainSkillsRequest.getHomeTown());
		userDetailsEntity.setMartialStatus(mainSkillsRequest.getMartialStatus());
		userDetailsEntity.setPinCode(mainSkillsRequest.getPinCode());
		userDetailsEntity.setProfileSummary(mainSkillsRequest.getProfileSummary());
		int index = 1;
		StringBuilder sb = new StringBuilder();
		for (String string : mainSkillsRequest.getSkills()) {

			index++;
			sb.append(string);
			if (index <= mainSkillsRequest.getSkills().length)
				sb.append(",");
		}

		userDetailsEntity.setSkills(sb.toString());
		userDetailsEntity.setUserId(userEntity.getUserId());

		userDetailsRepository.save(userDetailsEntity);

		mainSkillsResponse.setMessage("Successfully added the user Skills");
		mainSkillsResponse.setSuccess(true);
		return mainSkillsResponse;
	}

	@Override
	public EducationDetailsResponse addUserEducationDetails(EducationDetailsRequest educationDetailsRequest) {

		EducationDetailsResponse educationDetailsResponse = new EducationDetailsResponse();
		UserEntity userEntity = userRepository.findByLoginIdAndActive(educationDetailsRequest.getLoginId(),
				BusinessConstants.ACTIVE);

		if (Objects.isNull(userEntity)) {
			educationDetailsResponse.addValidationError(new ValidationError(ErrorCodes.INVALID_USER_ID.getCode(),
					ErrorCodes.INVALID_USER_ID.getDescription(), "loginId", educationDetailsRequest.getLoginId()));
			return educationDetailsResponse;
		}

		UserEducationHistoryEntity userEducationHistory = new UserEducationHistoryEntity();
		userEducationHistory.setDegreeId(educationDetailsRequest.getDegreeId());
		userEducationHistory.setEndDate(educationDetailsRequest.getEndDate());
		userEducationHistory.setStartDate(educationDetailsRequest.getStartDate());
		userEducationHistory.setInstitutionId(educationDetailsRequest.getInstitutionId());
		userEducationHistory.setIsHighestEducaton(educationDetailsRequest.getIsHighest());
		userEducationHistory.setMajor(educationDetailsRequest.getMajor());
		userEducationHistory.setUserId(userEntity.getUserId());

		userEducationHistoryRepository.save(userEducationHistory);

		educationDetailsResponse.setMessage("Successfully added the user education history");
		educationDetailsResponse.setSuccess(true);
		return educationDetailsResponse;
	}

	@Override
	public EmploymentHistoryResponse addUserEmploymentHistory(EmploymentHistoryRequest employmentHistoryRequest) {

		EmploymentHistoryResponse employmentHistoryResponse = new EmploymentHistoryResponse();
		UserEntity userEntity = userRepository.findByLoginIdAndActive(employmentHistoryRequest.getLoginId(),
				BusinessConstants.ACTIVE);

		if (Objects.isNull(userEntity)) {
			employmentHistoryResponse.addValidationError(new ValidationError(ErrorCodes.INVALID_USER_ID.getCode(),
					ErrorCodes.INVALID_USER_ID.getDescription(), "loginId", employmentHistoryRequest.getLoginId()));
			return employmentHistoryResponse;
		}

		UserEmploymentHistoryEntity userEmploytEmploymentHistoryEntity = new UserEmploymentHistoryEntity();
		userEmploytEmploymentHistoryEntity.setActive(employmentHistoryRequest.getActive());
		userEmploytEmploymentHistoryEntity.setDesignation(employmentHistoryRequest.getDesignation());
		userEmploytEmploymentHistoryEntity.setEmployer(employmentHistoryRequest.getEmployer());
		userEmploytEmploymentHistoryEntity.setEndDate(employmentHistoryRequest.getEndDate());
		userEmploytEmploymentHistoryEntity.setRole(employmentHistoryRequest.getRole());
		userEmploytEmploymentHistoryEntity.setStartDate(employmentHistoryRequest.getStartDate());
		userEmploytEmploymentHistoryEntity.setUserId(userEntity.getUserId());

		userEmploytEmploymentHistoryEntity = userEmploymentHistoryRepository.save(userEmploytEmploymentHistoryEntity);

		for (ProjectHistoryRequest projectDetails : employmentHistoryRequest.getProjectDetails()) {
			UserProjectHistoryEntity userProjectHistoryEntity = new UserProjectHistoryEntity();
			userProjectHistoryEntity.setEmploymentId(userEmploytEmploymentHistoryEntity.getUserEmploymentId());
			userProjectHistoryEntity.setEndDate(projectDetails.getEndDate());
			userProjectHistoryEntity.setProjectDescription(projectDetails.getProjectDescription());
			userProjectHistoryEntity.setProjectName(projectDetails.getProjectName());
			userProjectHistoryEntity.setStartDate(projectDetails.getStartDate());
			userProjectHistoryRepository.save(userProjectHistoryEntity);
		}

		employmentHistoryResponse.setMessage("Successfully added the user employment history");
		employmentHistoryResponse.setSuccess(true);
		return employmentHistoryResponse;

	}
}