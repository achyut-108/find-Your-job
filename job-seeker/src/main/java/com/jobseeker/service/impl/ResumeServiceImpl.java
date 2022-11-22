package com.jobseeker.service.impl;

import java.math.BigInteger;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobseeker.common.BusinessConstants;
import com.jobseeker.common.CommonServiceRequest;
import com.jobseeker.common.CommonServiceResponse;
import com.jobseeker.common.ErrorCodes;
import com.jobseeker.common.ValidationError;
import com.jobseeker.domain.dto.UserEducationHistory;
import com.jobseeker.domain.dto.UserEmploymentHistory;
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

	public CommonServiceResponse addSkillsAndGeneralDetails(MainSkillsRequest mainSkillsRequest) {

		CommonServiceResponse mainSkillsResponse = new CommonServiceResponse();
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
	public CommonServiceResponse addUserEducationDetails(EducationDetailsRequest educationDetailsRequest) {

		CommonServiceResponse educationDetailsResponse = new CommonServiceResponse();
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
	public CommonServiceResponse addUserEmploymentHistory(EmploymentHistoryRequest employmentHistoryRequest) {

		CommonServiceResponse employmentHistoryResponse = new CommonServiceResponse();
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

	@Override
	public MainSkillsResponse getMainSkills(@Valid CommonServiceRequest commonServiceRequest) {

		MainSkillsResponse mainSkillsResponse = new MainSkillsResponse();
		UserEntity userEntity = userRepository.findByLoginIdAndActive(commonServiceRequest.getLoginId(),
				BusinessConstants.ACTIVE);

		if (Objects.isNull(userEntity)) {
			mainSkillsResponse.addValidationError(new ValidationError(ErrorCodes.INVALID_USER_ID.getCode(),
					ErrorCodes.INVALID_USER_ID.getDescription(), "loginId", commonServiceRequest.getLoginId()));
			return mainSkillsResponse;
		}
		
		UserDetailsEntity userDetailsEntity = userDetailsRepository.findByUserId(userEntity.getUserId());
		mainSkillsResponse.setSkills(userDetailsEntity.getSkills());
		mainSkillsResponse.setSuccess(BusinessConstants.TRUE);
		mainSkillsResponse.setMessage(BusinessConstants.SUCCESS);
		return mainSkillsResponse;
	}

	@Override
	public EducationDetailsResponse getUserEductaionDetails(@Valid CommonServiceRequest commonServiceRequest) {
		EducationDetailsResponse educationDetailsResponse = new EducationDetailsResponse();
		UserEntity userEntity = userRepository.findByLoginIdAndActive(commonServiceRequest.getLoginId(),
				BusinessConstants.ACTIVE);

		if (Objects.isNull(userEntity)) {
			educationDetailsResponse.addValidationError(new ValidationError(ErrorCodes.INVALID_USER_ID.getCode(),
					ErrorCodes.INVALID_USER_ID.getDescription(), "loginId", commonServiceRequest.getLoginId()));
			return educationDetailsResponse;
		}
		
		List<Object[]> userEducationDetailsDb =  
				userEducationHistoryRepository.getUserEducationDetails(userEntity.getUserId());
		
		List<UserEducationHistory> educationDetails = null ;
		if(Objects.nonNull(userEducationDetailsDb) && !userEducationDetailsDb.isEmpty()) {
			
			educationDetails = userEducationDetailsDb.stream().map(obj->{
				UserEducationHistory userEducationHistory = new UserEducationHistory();
				userEducationHistory.setMajor(obj[0] == null ? null : (String) obj[0]);
				userEducationHistory.setStartDate(obj[1] == null ? null : (Date) obj[1]);
				userEducationHistory.setEndDate(obj[2] == null ? null : (Date) obj[2]);
				userEducationHistory.setIsHighestEducaton(obj[3] == null ? null : (String) obj[3]);
				userEducationHistory.setDegree(obj[4] == null ? null : (String) obj[4]);
				userEducationHistory.setDegreeDescription(obj[5] == null ? null : (String) obj[5]);
				userEducationHistory.setInstitutionName(obj[6] == null ? null : (String) obj[6]);
				userEducationHistory.setAddress(obj[7] == null ? null : (String) obj[7]);
				userEducationHistory.setPinCode(obj[8] == null ? null : (String) obj[8]);
				userEducationHistory.setLocation(obj[9] == null ? null : (String) obj[9]);	
				return userEducationHistory;
				
			}).collect(Collectors.toList());
			educationDetailsResponse.setMessage("Successfully fetched the education details");
		}else {
			educationDetailsResponse.setMessage("education details not updated");
		}
		
		educationDetailsResponse.setSuccess(BusinessConstants.TRUE);
		educationDetailsResponse.setEducationDetails(educationDetails);
		
		return educationDetailsResponse;
	}

	@Override
	public EmploymentHistoryResponse getUserEmploymentHistory(@Valid CommonServiceRequest commonServiceRequest) {
		EmploymentHistoryResponse employmentHistoryResponse = new EmploymentHistoryResponse();
		UserEntity userEntity = userRepository.findByLoginIdAndActive(commonServiceRequest.getLoginId(),
				BusinessConstants.ACTIVE);

		if (Objects.isNull(userEntity)) {
			employmentHistoryResponse.addValidationError(new ValidationError(ErrorCodes.INVALID_USER_ID.getCode(),
					ErrorCodes.INVALID_USER_ID.getDescription(), "loginId", commonServiceRequest.getLoginId()));
			return employmentHistoryResponse;
		}
		
		List<Object[]> userEmploymentDetailsDb =  
				userEmploymentHistoryRepository.getEmploymentHistory(userEntity.getUserId());
		
		List<UserEmploymentHistory> employmentHistories = null ;
		if(Objects.nonNull(userEmploymentDetailsDb) && !userEmploymentDetailsDb.isEmpty()) {
			
			employmentHistories = userEmploymentDetailsDb.stream().map(obj->{
				
				UserEmploymentHistory userEmploymentHistory = new UserEmploymentHistory();
				userEmploymentHistory.setDesignation(obj[0] == null ? null : (String) obj[0]);
				userEmploymentHistory.setEmployer(obj[1] == null ? null : (String) obj[1]);
				userEmploymentHistory.setJobStartDate(obj[2] == null ? null : (Date) obj[2]);
				userEmploymentHistory.setJobEndDate(obj[3] == null ? null : (Date) obj[3]);
				userEmploymentHistory.setCurrentActiveJob(obj[4] == null ? null : (String) obj[4]);
				userEmploymentHistory.setJobRole(obj[5] == null ? null : (String) obj[5]);
				userEmploymentHistory.setProjectDescription(obj[6] == null ? null : (String) obj[6]);
				userEmploymentHistory.setProjectName(obj[7] == null ? null : (String) obj[7]);
				userEmploymentHistory.setProjectStartDate(obj[8] == null ? null : (Date) obj[8]);
				userEmploymentHistory.setProjectEndDate(obj[9] == null ? null : (Date) obj[9]);
				return userEmploymentHistory;
				
			}).collect(Collectors.toList());
			employmentHistoryResponse.setMessage("Successfully fetched the employment details");
		}else {
			employmentHistoryResponse.setMessage("Employment History not updated");
		}
		
		employmentHistoryResponse.setSuccess(BusinessConstants.TRUE);
		employmentHistoryResponse.setEmploymentDetails(employmentHistories);
		
		return employmentHistoryResponse;
	}
}