package com.fyj.service.impl;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fyj.common.BusinessConstants;
import com.fyj.common.ErrorCodes;
import com.fyj.common.ValidationError;
import com.fyj.domain.resume.EducationDetailsRequest;
import com.fyj.domain.resume.EducationDetailsResponse;
import com.fyj.domain.resume.EmploymentHistoryRequest;
import com.fyj.domain.resume.EmploymentHistoryResponse;
import com.fyj.domain.resume.MainSkillsRequest;
import com.fyj.domain.resume.MainSkillsResponse;
import com.fyj.domain.resume.ProjectHistoryRequest;
import com.fyj.entity.UserDetailsEntity;
import com.fyj.entity.UserEducationHistoryEntity;
import com.fyj.entity.UserEmploymentHistoryEntity;
import com.fyj.entity.UserEntity;
import com.fyj.entity.UserProjectHistoryEntity;
import com.fyj.repo.UserDetailsRepository;
import com.fyj.repo.UserEducationHistoryRepository;
import com.fyj.repo.UserEmploymentHistoryRepository;
import com.fyj.repo.UserProjectHistoryRepository;
import com.fyj.repo.UserRepository;
import com.fyj.service.ResumeService;

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