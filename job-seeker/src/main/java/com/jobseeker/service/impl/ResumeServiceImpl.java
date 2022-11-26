package com.jobseeker.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
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
import com.jobseeker.domain.resume.EducationDetailsEditRequest;
import com.jobseeker.domain.resume.EducationDetailsRequest;
import com.jobseeker.domain.resume.EducationDetailsResponse;
import com.jobseeker.domain.resume.EmploymentHistoryEditRequest;
import com.jobseeker.domain.resume.EmploymentHistoryRequest;
import com.jobseeker.domain.resume.EmploymentHistoryResponse;
import com.jobseeker.domain.resume.JobApplicationStatusRequest;
import com.jobseeker.domain.resume.JobApplicationStatusResponse;
import com.jobseeker.domain.resume.MainSkillsEditRequest;
import com.jobseeker.domain.resume.MainSkillsRequest;
import com.jobseeker.domain.resume.MainSkillsResponse;
import com.jobseeker.domain.resume.ProjectHistory;
import com.jobseeker.domain.resume.ProjectHistoryEditRequest;
import com.jobseeker.domain.resume.ProjectHistoryRequest;
import com.jobseeker.domain.resume.ProjectHistoryResponse;
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

		List<Object[]> userEducationDetailsDb = userEducationHistoryRepository
				.getUserEducationDetails(userEntity.getUserId());

		List<UserEducationHistory> educationDetails = null;
		if (Objects.nonNull(userEducationDetailsDb) && !userEducationDetailsDb.isEmpty()) {

			educationDetails = userEducationDetailsDb.stream().map(obj -> {
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
		} else {
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

		List<UserEmploymentHistoryEntity> userEmploymentDetailsDb = userEmploymentHistoryRepository
				.findByUserId(userEntity.getUserId());

		List<UserEmploymentHistory> employmentHistories = null;
		if (Objects.nonNull(userEmploymentDetailsDb) && !userEmploymentDetailsDb.isEmpty()) {

			employmentHistories = userEmploymentDetailsDb.stream().map(userEmployment -> {
				UserEmploymentHistory userEmploymentHistory = new UserEmploymentHistory();
				userEmploymentHistory.setDesignation(userEmployment.getDesignation());
				userEmploymentHistory.setEmployer(userEmployment.getEmployer());
				userEmploymentHistory.setJobStartDate(userEmployment.getStartDate());
				userEmploymentHistory.setJobEndDate(userEmployment.getEndDate());
				userEmploymentHistory.setCurrentActiveJob(userEmployment.getActive());
				userEmploymentHistory.setJobRole(userEmployment.getRole());
				userEmploymentHistory.setUserEmploymentHistoryId(userEmployment.getUserEmploymentId());
				return userEmploymentHistory;

			}).collect(Collectors.toList());
			employmentHistoryResponse.setMessage("Successfully fetched the employment details");
		} else {
			employmentHistoryResponse.setMessage("Employment History not updated");
		}

		employmentHistoryResponse.setSuccess(BusinessConstants.TRUE);
		employmentHistoryResponse.setEmploymentDetails(employmentHistories);

		return employmentHistoryResponse;
	}

	@Override
	public ProjectHistoryResponse getProjectHisoryForAEmployment(ProjectHistoryEditRequest projectHistoryEditRequest) {
		ProjectHistoryResponse projectHistoryResponse = new ProjectHistoryResponse();
		UserEntity userEntity = userRepository.findByLoginIdAndActive(projectHistoryEditRequest.getLoginId(),
				BusinessConstants.ACTIVE);

		if (Objects.isNull(userEntity)) {
			projectHistoryResponse.addValidationError(new ValidationError(ErrorCodes.INVALID_USER_ID.getCode(),
					ErrorCodes.INVALID_USER_ID.getDescription(), "loginId", projectHistoryEditRequest.getLoginId()));
			projectHistoryResponse.setSuccess(BusinessConstants.FALSE);
			return projectHistoryResponse;
		}

		List<UserProjectHistoryEntity> projectDetailsOfAEmploymentDb = userProjectHistoryRepository
				.findByEmploymentId(projectHistoryEditRequest.getEmploymentId());

		List<ProjectHistory> projectHistories = null;
		if (Objects.nonNull(projectDetailsOfAEmploymentDb) && !projectDetailsOfAEmploymentDb.isEmpty()) {

			projectHistories = projectDetailsOfAEmploymentDb.stream().map(projectHistoryDb -> {
				ProjectHistory projectHistory = new ProjectHistory();
				projectHistory.setEmploymentId(projectHistoryDb.getEmploymentId());
				projectHistory.setProjectEndDate(projectHistoryDb.getEndDate());
				projectHistory.setProjectDescription(projectHistoryDb.getProjectDescription());
				projectHistory.setProjectId(projectHistoryDb.getProjectId());
				projectHistory.setProjectName(projectHistoryDb.getProjectName());
				projectHistory.setProjectStartDate(projectHistoryDb.getStartDate());
				return projectHistory;
			}).collect(Collectors.toList());

			projectHistoryResponse.setMessage("Successfully fetched the project details");
		} else {
			projectHistoryResponse.setMessage("Project History not updated");
		}

		projectHistoryResponse.setSuccess(BusinessConstants.TRUE);
		projectHistoryResponse.setProjectHistories(projectHistories);

		return projectHistoryResponse;
	}

	@Override
	public CommonServiceResponse editSkillsAndGeneralDetails(MainSkillsEditRequest mainSkillsRequest) {
		CommonServiceResponse mainSkillsResponse = new CommonServiceResponse();
		UserEntity userEntity = userRepository.findByLoginIdAndActive(mainSkillsRequest.getLoginId(),
				BusinessConstants.ACTIVE);

		if (Objects.isNull(userEntity)) {
			mainSkillsResponse.addValidationError(new ValidationError(ErrorCodes.INVALID_USER_ID.getCode(),
					ErrorCodes.INVALID_USER_ID.getDescription(), "loginId", mainSkillsRequest.getLoginId()));
			return mainSkillsResponse;
		}

		UserDetailsEntity userDetailsEntity = userDetailsRepository.findByUserId(userEntity.getUserId());

		if (Objects.nonNull(userDetailsEntity)) {
			userDetailsEntity.setAddress(mainSkillsRequest.getAddress() != null ? mainSkillsRequest.getAddress()
					: userDetailsEntity.getAddress());
			userDetailsEntity
					.setDateOfBirth(mainSkillsRequest.getDateOfBirth() != null ? mainSkillsRequest.getDateOfBirth()
							: userDetailsEntity.getDateOfBirth());
			userDetailsEntity.setGender(mainSkillsRequest.getGender() != null ? mainSkillsRequest.getGender()
					: userDetailsEntity.getGender());
			userDetailsEntity.setHomeTown(mainSkillsRequest.getHomeTown() != null ? mainSkillsRequest.getHomeTown()
					: userDetailsEntity.getHomeTown());
			userDetailsEntity.setMartialStatus(
					mainSkillsRequest.getMartialStatus() != null ? mainSkillsRequest.getMartialStatus()
							: userDetailsEntity.getMartialStatus());
			userDetailsEntity.setPinCode(mainSkillsRequest.getPinCode() != null ? mainSkillsRequest.getPinCode()
					: userDetailsEntity.getPinCode());
			userDetailsEntity.setProfileSummary(
					mainSkillsRequest.getProfileSummary() != null ? mainSkillsRequest.getProfileSummary()
							: userDetailsEntity.getProfileSummary());
		}

		if (mainSkillsRequest.getSkills() != null) {
			int index = 1;
			StringBuilder sb = new StringBuilder();
			for (String string : mainSkillsRequest.getSkills()) {

				index++;
				sb.append(string);
				if (index <= mainSkillsRequest.getSkills().length)
					sb.append(",");
			}

			userDetailsEntity.setSkills(sb.toString());
		}

		userDetailsRepository.save(userDetailsEntity);

		mainSkillsResponse.setMessage("Successfully edited the user Skills");
		mainSkillsResponse.setSuccess(true);
		return mainSkillsResponse;
	}

	/**
	 * TO DO : Validation for DegreeId and the InstitutionId
	 */
	@Override
	public CommonServiceResponse editUserEducationDetails(EducationDetailsEditRequest educationDetailsEditRequest) {
		UserEntity userEntity = userRepository.findByLoginIdAndActive(educationDetailsEditRequest.getLoginId(),
				BusinessConstants.ACTIVE);

		CommonServiceResponse commonServiceResponse = new CommonServiceResponse();
		if (Objects.isNull(userEntity)) {
			commonServiceResponse.addValidationError(new ValidationError(ErrorCodes.INVALID_USER_ID.getCode(),
					ErrorCodes.INVALID_USER_ID.getDescription(), "loginId", educationDetailsEditRequest.getLoginId()));
			commonServiceResponse.setSuccess(BusinessConstants.FALSE);
			return commonServiceResponse;
		}

		Optional<UserEducationHistoryEntity> userEducationDetailsDbOpt = userEducationHistoryRepository
				.findById(educationDetailsEditRequest.getUserEducationId());

		if (!userEducationDetailsDbOpt.isPresent()) {
			commonServiceResponse
					.addValidationError(new ValidationError(ErrorCodes.EDUCATION_DETAILS_DO_NOT_EXIST.getCode(),
							ErrorCodes.EDUCATION_DETAILS_DO_NOT_EXIST.getDescription(), "userEducationId",
							educationDetailsEditRequest.getUserEducationId()));
			commonServiceResponse.setSuccess(BusinessConstants.FALSE);
		} else {
			UserEducationHistoryEntity userEducationDetailsDb = userEducationDetailsDbOpt.get();
			userEducationDetailsDb.setDegreeId(educationDetailsEditRequest.getDegreeId()!=null ? 
					educationDetailsEditRequest.getDegreeId() : userEducationDetailsDb.getDegreeId());
			userEducationDetailsDb.setEndDate(educationDetailsEditRequest.getEndDate()!=null ?
					educationDetailsEditRequest.getEndDate() : userEducationDetailsDb.getEndDate());
			userEducationDetailsDb.setInstitutionId(educationDetailsEditRequest.getInstitutionId()!=null ?
					educationDetailsEditRequest.getInstitutionId() : userEducationDetailsDb.getInstitutionId());
			userEducationDetailsDb.setIsHighestEducaton(educationDetailsEditRequest.getIsHighest()!=null ? educationDetailsEditRequest.getIsHighest()
					: userEducationDetailsDb.getIsHighestEducaton());
			userEducationDetailsDb.setMajor(educationDetailsEditRequest.getMajor()!=null ? 
					educationDetailsEditRequest.getMajor() : userEducationDetailsDb.getMajor());
			userEducationDetailsDb.setStartDate(educationDetailsEditRequest.getStartDate()!=null
					? educationDetailsEditRequest.getStartDate() : userEducationDetailsDb.getStartDate());
			userEducationHistoryRepository.save(userEducationDetailsDb);
			commonServiceResponse.setMessage("education details not updated");
			commonServiceResponse.setSuccess(BusinessConstants.TRUE);
		}

		return commonServiceResponse;
	}

	@Override
	public CommonServiceResponse editUserEmploymentHistory(EmploymentHistoryEditRequest employmentHistoryRequest) {
		CommonServiceResponse employmentHistoryResponse = new CommonServiceResponse();
		UserEntity userEntity = userRepository.findByLoginIdAndActive(employmentHistoryRequest.getLoginId(),
				BusinessConstants.ACTIVE);

		if (Objects.isNull(userEntity)) {
			employmentHistoryResponse.setSuccess(BusinessConstants.FALSE);
			employmentHistoryResponse.addValidationError(new ValidationError(ErrorCodes.INVALID_USER_ID.getCode(),
					ErrorCodes.INVALID_USER_ID.getDescription(), "loginId", employmentHistoryRequest.getLoginId()));
			return employmentHistoryResponse;
		}

		Optional<UserEmploymentHistoryEntity> userEmploymentHistoryOpt = userEmploymentHistoryRepository
				.findById(employmentHistoryRequest.getUserEmploymentHistoryId());

		if (!userEmploymentHistoryOpt.isPresent()) {
			employmentHistoryResponse.setSuccess(BusinessConstants.FALSE);
			employmentHistoryResponse
					.addValidationError(new ValidationError(ErrorCodes.EMPLOYMENT_HISTORY_DOES_NOT_EXIST.getCode(),
							ErrorCodes.EMPLOYMENT_HISTORY_DOES_NOT_EXIST.getDescription(), "userEmploymentHistoryId",
							employmentHistoryRequest.getUserEmploymentHistoryId()));
			return employmentHistoryResponse;
		}

		UserEmploymentHistoryEntity userEmploymentHistoryEntity = userEmploymentHistoryOpt.get();

		userEmploymentHistoryEntity
				.setActive(employmentHistoryRequest.getActive() != null ? employmentHistoryRequest.getActive()
						: userEmploymentHistoryEntity.getActive());
		userEmploymentHistoryEntity.setDesignation(
				employmentHistoryRequest.getDesignation() != null ? employmentHistoryRequest.getDesignation()
						: userEmploymentHistoryEntity.getDesignation());
		userEmploymentHistoryEntity
				.setEmployer(employmentHistoryRequest.getEmployer() != null ? employmentHistoryRequest.getEmployer()
						: userEmploymentHistoryEntity.getEmployer());
		userEmploymentHistoryEntity
				.setEndDate(employmentHistoryRequest.getEndDate() != null ? employmentHistoryRequest.getEndDate()
						: userEmploymentHistoryEntity.getEndDate());
		userEmploymentHistoryEntity
				.setRole(employmentHistoryRequest.getRole() != null ? employmentHistoryRequest.getRole()
						: userEmploymentHistoryEntity.getRole());
		userEmploymentHistoryEntity
				.setStartDate(employmentHistoryRequest.getStartDate() != null ? employmentHistoryRequest.getStartDate()
						: userEmploymentHistoryEntity.getStartDate());

		userEmploymentHistoryEntity = userEmploymentHistoryRepository.save(userEmploymentHistoryEntity);
		employmentHistoryResponse.setMessage("Successfully added the user employment history");
		employmentHistoryResponse.setSuccess(true);
		return employmentHistoryResponse;

	}

	@Override
	public CommonServiceResponse editProjectHisory(ProjectHistoryEditRequest projectHistoryEditRequest) {
		CommonServiceResponse commonServiceResponse = new CommonServiceResponse();
		UserEntity userEntity = userRepository.findByLoginIdAndActive(projectHistoryEditRequest.getLoginId(),
				BusinessConstants.ACTIVE);

		if (Objects.isNull(userEntity)) {
			commonServiceResponse.addValidationError(new ValidationError(ErrorCodes.INVALID_USER_ID.getCode(),
					ErrorCodes.INVALID_USER_ID.getDescription(), "loginId", projectHistoryEditRequest.getLoginId()));
			commonServiceResponse.setSuccess(BusinessConstants.FALSE);
			return commonServiceResponse;
		}

		Optional<UserProjectHistoryEntity> projectHistoryDbOpt = userProjectHistoryRepository
				.findById(projectHistoryEditRequest.getProjectId());

		if (!projectHistoryDbOpt.isPresent()) {
			commonServiceResponse
					.addValidationError(new ValidationError(ErrorCodes.PROJECT_HISTORY_DOES_NOT_EXIST.getCode(),
							ErrorCodes.PROJECT_HISTORY_DOES_NOT_EXIST.getDescription(), "loginId",
							projectHistoryEditRequest.getLoginId()));
			commonServiceResponse.setSuccess(BusinessConstants.FALSE);
			return commonServiceResponse;
		} else {
			UserProjectHistoryEntity projectHistoryDb = projectHistoryDbOpt.get();
			projectHistoryDb
					.setEndDate(projectHistoryEditRequest.getEndDate() != null ? projectHistoryEditRequest.getEndDate()
							: projectHistoryDb.getEndDate());
			projectHistoryDb.setProjectDescription(projectHistoryEditRequest.getProjectDescription() != null
					? projectHistoryEditRequest.getProjectDescription()
					: projectHistoryEditRequest.getProjectDescription());
			projectHistoryDb.setProjectName(
					projectHistoryEditRequest.getProjectName() != null ? projectHistoryEditRequest.getProjectName()
							: projectHistoryDb.getProjectName());
			projectHistoryDb.setStartDate(
					projectHistoryEditRequest.getStartDate() != null ? projectHistoryEditRequest.getStartDate()
							: projectHistoryDb.getStartDate());
			userProjectHistoryRepository.save(projectHistoryDb);
			commonServiceResponse.setMessage("Project History successfully updated");
			commonServiceResponse.setSuccess(true);
		}

		return commonServiceResponse;
	}
}