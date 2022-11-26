package com.recruiter.service.impl;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.recruiter.common.BusinessConstants;
import com.recruiter.common.CommonServiceResponse;
import com.recruiter.common.ErrorCodes;
import com.recruiter.common.UserTypeValidator;
import com.recruiter.common.ValidationError;
import com.recruiter.domain.job.JobDetailsDeleteRequest;
import com.recruiter.domain.job.JobDetailsRequest;
import com.recruiter.domain.job.JobDetailsResponse;
import com.recruiter.domain.job.JobSearchResponse;
import com.recruiter.domain.job.JobSeekerDetails;
import com.recruiter.domain.job.JobSeekerDetailsResponse;
import com.recruiter.domain.job.RecruiterActionsOnJobApplicationRequest;
import com.recruiter.domain.recruiterdetails.RecruiterDetailsResponse;
import com.recruiter.domain.recruiterdetails.RecruiterJobDetailsResponse;
import com.recruiter.entity.CompanyJobsAndDetailsEntity;
import com.recruiter.entity.CompanyJobsDetailsEntity;
import com.recruiter.entity.CompanyJobsEntity;
import com.recruiter.entity.CompanyMasterEntity;
import com.recruiter.entity.JobApplicationHistoryEntity;
import com.recruiter.entity.UserDetailsEntity;
import com.recruiter.entity.UserEntity;
import com.recruiter.repo.CompanyJobsAndDetailsRepository;
import com.recruiter.repo.CompanyJobsDetailsRepository;
import com.recruiter.repo.CompanyJobsRepository;
import com.recruiter.repo.CompanyMasterRepository;
import com.recruiter.repo.JobApplicationHistoryRepo;
import com.recruiter.repo.UserDetailsRepository;
import com.recruiter.repo.UserRepository;
import com.recruiter.service.JobService;

@Service
public class JobServiceImpl implements JobService {

	@Autowired
	private CompanyJobsRepository companyJobsRepository;
	@Autowired
	private CompanyJobsDetailsRepository companyJobsDetailsRepository;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private CompanyMasterRepository companyMasterRepository;
	@Autowired
	private CompanyJobsAndDetailsRepository companyJobsAndDetailsRepository;
	@Autowired
	private JobApplicationHistoryRepo jobApplicationHistoryRepo;
	@Autowired
	private UserDetailsRepository userDetailsRepository;

	private static final Logger log = LoggerFactory.getLogger(JobServiceImpl.class);

	@Override
	public JobDetailsResponse addJobDetails(JobDetailsRequest jobDetailsRequest) {
		JobDetailsResponse jobDetailsResponse = new JobDetailsResponse();
		UserEntity userEntity = userRepository.findByLoginIdAndActive(jobDetailsRequest.getLoginId(),
				BusinessConstants.ACTIVE);

		if (Objects.isNull(userEntity)) {
			jobDetailsResponse.addValidationError(new ValidationError(ErrorCodes.INVALID_USER_ID.getCode(),
					ErrorCodes.INVALID_USER_ID.getDescription(), "loginId", jobDetailsRequest.getLoginId()));
			return jobDetailsResponse;
		}

		CompanyMasterEntity companyMasterEntity = companyMasterRepository.findByUserId(userEntity.getUserId());

		CompanyJobsEntity companyJobsEntity = new CompanyJobsEntity();
		companyJobsEntity.setActive(jobDetailsRequest.getActive());
		companyJobsEntity.setCompanyId(companyMasterEntity.getCompanyId());
		companyJobsEntity.setJobDescription(jobDetailsRequest.getJobDescription());
		companyJobsEntity.setJobTitle(jobDetailsRequest.getJobTitle());
		companyJobsEntity.setJobTypeId(jobDetailsRequest.getJobTypeId());
		companyJobsEntity.setPostedBy(userEntity.getUserId());

		companyJobsEntity = companyJobsRepository.save(companyJobsEntity);

		if (Objects.nonNull(companyJobsEntity.getJobId())) {
			CompanyJobsDetailsEntity companyJobsDetailsEntity = new CompanyJobsDetailsEntity();
			companyJobsDetailsEntity.setActive(jobDetailsRequest.getActive());
			companyJobsDetailsEntity.setCtcOffered(jobDetailsRequest.getCtcOffered());
			companyJobsDetailsEntity.setEndDate(null);
			companyJobsDetailsEntity.setJobCreationDate(new Date());
			companyJobsDetailsEntity.setJobId(companyJobsEntity.getJobId());
			companyJobsDetailsEntity.setJobLocation(jobDetailsRequest.getJobLocation());
			companyJobsDetailsEntity.setSalaryPerHour(jobDetailsRequest.getSalaryPerHour());
			int index = 1;
			StringBuilder sb = new StringBuilder();
			for (String string : jobDetailsRequest.getSkillsRequired()) {

				index++;
				sb.append(string);
				if (index <= jobDetailsRequest.getSkillsRequired().length)
					sb.append(",");
			}

			companyJobsDetailsEntity.setSkillsRequired(sb.toString());

			companyJobsDetailsRepository.save(companyJobsDetailsEntity);

		}

		jobDetailsResponse.setMessage("Successfully posted the job details");
		jobDetailsResponse.setSuccess(true);

		return jobDetailsResponse;
	}

	@Override
	public JobDetailsResponse editJobDetails(JobDetailsRequest jobDetailsRequest) {

		JobDetailsResponse jobDetailsResponse = new JobDetailsResponse();
		UserEntity userEntity = userRepository.findByLoginIdAndActive(jobDetailsRequest.getLoginId(),
				BusinessConstants.ACTIVE);

		if (Objects.isNull(userEntity)) {
			jobDetailsResponse.addValidationError(new ValidationError(ErrorCodes.INVALID_USER_ID.getCode(),
					ErrorCodes.INVALID_USER_ID.getDescription(), "loginId", jobDetailsRequest.getLoginId()));
			return jobDetailsResponse;
		}

		if (jobDetailsRequest.isEditJob()) {
			if (Objects.nonNull(jobDetailsRequest.getJobId())) {
				Optional<CompanyJobsEntity> companyJobsEntityOpt = companyJobsRepository
						.findById(jobDetailsRequest.getJobId());
				if (!companyJobsEntityOpt.isPresent()) {
					jobDetailsResponse.addValidationError(new ValidationError(ErrorCodes.INVALID_JOB_ID.getCode(),
							ErrorCodes.INVALID_JOB_ID.getDescription(), "jobId", jobDetailsRequest.getJobId()));
					return jobDetailsResponse;
				}
				CompanyJobsEntity companyJobsEntity = companyJobsEntityOpt.get();
				companyJobsEntity.setActive(jobDetailsRequest.getActive());
				companyJobsEntity.setJobDescription(jobDetailsRequest.getJobDescription());
				companyJobsEntity.setJobTitle(jobDetailsRequest.getJobTitle());
				companyJobsEntity.setJobTypeId(jobDetailsRequest.getJobTypeId());

				companyJobsEntity = companyJobsRepository.save(companyJobsEntity);

				CompanyJobsDetailsEntity companyJobsDetailsEntity = companyJobsDetailsRepository
						.findByJobId(jobDetailsRequest.getJobId());

				companyJobsDetailsEntity.setActive(jobDetailsRequest.getActive());
				companyJobsDetailsEntity.setCtcOffered(jobDetailsRequest.getCtcOffered());
				companyJobsDetailsEntity.setEndDate(null);
				companyJobsDetailsEntity.setJobCreationDate(new Date());
				companyJobsDetailsEntity.setJobId(companyJobsEntity.getJobId());
				companyJobsDetailsEntity.setJobLocation(jobDetailsRequest.getJobLocation());
				companyJobsDetailsEntity.setSalaryPerHour(jobDetailsRequest.getSalaryPerHour());
				int index = 1;
				StringBuilder sb = new StringBuilder();
				for (String string : jobDetailsRequest.getSkillsRequired()) {

					index++;
					sb.append(string);
					if (index <= jobDetailsRequest.getSkillsRequired().length)
						sb.append(",");
				}

				companyJobsDetailsEntity.setSkillsRequired(sb.toString());

				companyJobsDetailsRepository.save(companyJobsDetailsEntity);

			} else {
				jobDetailsResponse.addValidationError(new ValidationError(ErrorCodes.INVALID_JOB_ID.getCode(),
						ErrorCodes.INVALID_JOB_ID.getDescription(), "jobId", jobDetailsRequest.getJobId()));
				return jobDetailsResponse;
			}
		}

		jobDetailsResponse.setMessage("Successfully posted the job details");
		jobDetailsResponse.setSuccess(true);

		return jobDetailsResponse;
	}

	@Override
	public JobDetailsResponse deleteJobDetails(JobDetailsDeleteRequest jobDetailsDeleteRequest) {

		JobDetailsResponse jobDetailsResponse = new JobDetailsResponse();
		UserEntity userEntity = userRepository.findByLoginIdAndActive(jobDetailsDeleteRequest.getLoginId(),
				BusinessConstants.ACTIVE);

		if (Objects.isNull(userEntity)) {
			jobDetailsResponse.addValidationError(new ValidationError(ErrorCodes.INVALID_USER_ID.getCode(),
					ErrorCodes.INVALID_USER_ID.getDescription(), "loginId", jobDetailsDeleteRequest.getLoginId()));
			return jobDetailsResponse;
		}

		if (Objects.isNull(jobDetailsDeleteRequest.getJobId())) {
			jobDetailsResponse.addValidationError(new ValidationError(ErrorCodes.INVALID_JOB_ID.getCode(),
					ErrorCodes.INVALID_JOB_ID.getDescription(), "jobId", jobDetailsDeleteRequest.getJobId()));
			return jobDetailsResponse;
		}

		CompanyJobsEntity companyJobsEntity = companyJobsRepository
				.findByJobIdAndActive(jobDetailsDeleteRequest.getJobId(), BusinessConstants.ACTIVE);

		if (Objects.isNull(companyJobsEntity)) {
			jobDetailsResponse.addValidationError(new ValidationError(ErrorCodes.INVALID_JOB_ID.getCode(),
					ErrorCodes.INVALID_JOB_ID.getDescription(), "jobId", jobDetailsDeleteRequest.getJobId()));
			return jobDetailsResponse;
		}

		if (companyJobsEntity.getPostedBy().compareTo(userEntity.getUserId()) == 0) {
			companyJobsEntity.setActive(BusinessConstants.INACTIVE);
			companyJobsRepository.save(companyJobsEntity);
			jobDetailsResponse.setMessage("Successfully deleted the job details");
			jobDetailsResponse.setSuccess(true);
			return jobDetailsResponse;
		} else {
			jobDetailsResponse.addValidationError(new ValidationError(ErrorCodes.RECRUITER_DOES_NOT_EXIST.getCode(),
					ErrorCodes.RECRUITER_DOES_NOT_EXIST.getDescription(), "loginId",
					jobDetailsDeleteRequest.getLoginId()));
		}

		return jobDetailsResponse;
	}

	@Override
	public JobSearchResponse getAllJobs() {
		List<CompanyJobsAndDetailsEntity> companyJobAndDetails = (List<CompanyJobsAndDetailsEntity>) companyJobsAndDetailsRepository
				.findAll();

		for (CompanyJobsAndDetailsEntity companyJobsAndDetailsEntity : companyJobAndDetails) {
			log.info("get all jobs response : " + companyJobsAndDetailsEntity.getJobId());
		}

		List<Integer> companyIds = companyJobAndDetails.stream().map(e -> {
			return e.getCompanyId();
		}).distinct().toList();

		List<CompanyMasterEntity> companies = (List<CompanyMasterEntity>) companyMasterRepository
				.findAllById(companyIds);

		Map<Integer, CompanyMasterEntity> companyMap = new HashMap<>();

		companies.forEach(company -> {
			companyMap.put(company.getCompanyId(), company);
		});

		companyJobAndDetails.forEach(e -> {
			CompanyMasterEntity company = companyMap.get(e.getCompanyId());
			e.setCompanyName(company.getCompanyName());
			e.setCompanyDescription(company.getCompanyDescription());
		});

		JobSearchResponse jobSearchResponse = new JobSearchResponse();
		jobSearchResponse.setMessage("Successfully fetched the posted jobs");
		jobSearchResponse.setSuccess(true);
		jobSearchResponse.setCompanyjobsAndDetailsList(companyJobAndDetails);

		return jobSearchResponse;
	}

	@Override
	public RecruiterDetailsResponse getRecruiterBasicDetailsByCompanyId(Integer companyId) {
		Optional<CompanyMasterEntity> companyMasterOpt = companyMasterRepository.findById(companyId);

		RecruiterDetailsResponse response = new RecruiterDetailsResponse();
		if (companyMasterOpt.isPresent()) {
			CompanyMasterEntity companyMaster = companyMasterOpt.get();
			Optional<UserEntity> userOpt = userRepository.findById(companyMaster.getUserId());
			if (!userOpt.isPresent()) {
				response.addValidationError(new ValidationError(ErrorCodes.RECRUITER_DOES_NOT_EXIST.getCode(),
						ErrorCodes.RECRUITER_DOES_NOT_EXIST.getDescription(), "companyId", companyId));
				return response;
			}
			UserEntity userEntity = userOpt.get();
			response.setActive(userEntity.getActive());
			response.setEmail(userEntity.getEmail());
			response.setFirstName(userEntity.getFirstName());
			response.setLastName(userEntity.getLastName());
			response.setMobileNumber(userEntity.getMobileNumber());
			return response;
		}
		response.addValidationError(
				new ValidationError("FYJ_ERROR_607", "Recruiter does not exist", "companyId", companyId));
		return response;
	}

	@Override
	public RecruiterDetailsResponse getRecruiterBasicDetailsByLoginId(String loginId) {

		RecruiterDetailsResponse response = new RecruiterDetailsResponse();
		UserEntity userEntity = userRepository.findByLoginIdAndActive(loginId, BusinessConstants.ACTIVE);
		if (Objects.isNull(userEntity)) {
			response.addValidationError(new ValidationError(ErrorCodes.RECRUITER_DOES_NOT_EXIST.getCode(),
					ErrorCodes.RECRUITER_DOES_NOT_EXIST.getDescription(), "loginId", loginId));
			response.setSuccess(BusinessConstants.FALSE);
			return response;
		}

		response.setActive(userEntity.getActive());
		response.setEmail(userEntity.getEmail());
		response.setFirstName(userEntity.getFirstName());
		response.setLastName(userEntity.getLastName());
		response.setMobileNumber(userEntity.getMobileNumber());
		response.setUserId(userEntity.getUserId());

		Optional<UserDetailsEntity> userDetailsEntityOpt = userDetailsRepository.findById(userEntity.getUserId());

		if (userDetailsEntityOpt.isPresent()) {
			UserDetailsEntity userDetailsEntity = userDetailsEntityOpt.get();
			response.setAddress(userDetailsEntity.getAddress());
			response.setDateOfBirth(userDetailsEntity.getDateOfBirth());
			response.setGender(userDetailsEntity.getGender());
			response.setHomeTown(userDetailsEntity.getHomeTown());
			response.setMarialStatus(userDetailsEntity.getMartialStatus());
			response.setPinCode(userDetailsEntity.getPinCode());
			response.setProfileSummary(userDetailsEntity.getProfileSummary());
		}

		response.setSuccess(BusinessConstants.TRUE);
		response.setMessage("Successfully fetched the basic details");
		return response;
	}

	@Override
	public RecruiterJobDetailsResponse getAllJobsPostedByARecruiter(String loginId) {

		RecruiterJobDetailsResponse response = new RecruiterJobDetailsResponse();
		UserEntity userEntity = userRepository.findByLoginIdAndActive(loginId, BusinessConstants.ACTIVE);
		if (Objects.isNull(userEntity)) {
			response.addValidationError(new ValidationError(ErrorCodes.INVALID_USER_ID.getCode(),
					ErrorCodes.INVALID_USER_ID.getDescription(), "loginId", loginId));
			return response;
		}

		response.setActive(userEntity.getActive());
		response.setEmail(userEntity.getEmail());
		response.setFirstName(userEntity.getFirstName());
		response.setLastName(userEntity.getLastName());
		response.setMobileNumber(userEntity.getMobileNumber());
		response.setUserType(UserTypeValidator.INSTANCE.getUserType(userEntity.getUserTypeId()));

		List<Object[]> jobsPostedByARecruiter = companyJobsRepository.jobsPostedByARecruiter(userEntity.getUserId());
		List<CompanyJobsAndDetailsEntity> companyJobsAndDetailsEntities = new ArrayList();
		for (Object[] obj : jobsPostedByARecruiter) {
			CompanyJobsAndDetailsEntity companyJobsAndDetailsEntity = new CompanyJobsAndDetailsEntity();
			CompanyJobsDetailsEntity jobDetails = new CompanyJobsDetailsEntity();
			companyJobsAndDetailsEntity
					.setJobId(obj[0] == null ? null : BigInteger.valueOf((Long.valueOf(obj[0].toString()))));
			companyJobsAndDetailsEntity.setCompanyId(obj[1] == null ? null : (Integer) obj[1]);
			companyJobsAndDetailsEntity.setJobTitle(obj[2] == null ? null : (String) obj[2]);
			companyJobsAndDetailsEntity.setJobDescription(obj[3] == null ? null : (String) obj[3]);
			companyJobsAndDetailsEntity.setJobTypeId(obj[4] == null ? null : (Integer) obj[4]);
			companyJobsAndDetailsEntity
					.setJobType(BusinessConstants.getJobTypeMap().get(companyJobsAndDetailsEntity.getJobTypeId()));
			jobDetails.setJobDetailsId(obj[5] == null ? null : BigInteger.valueOf((Long.valueOf(obj[5].toString()))));
			jobDetails.setSalaryPerHour(obj[6] == null ? null : (Integer) obj[6]);
			jobDetails.setSkillsRequired(obj[7] == null ? null : (String) obj[7]);
			jobDetails.setJobLocation(obj[8] == null ? null : (String) obj[8]);
			jobDetails.setJobCreationDate(obj[9] == null ? null : (Date) obj[9]);
			jobDetails.setEndDate(obj[10] == null ? null : (Date) obj[10]);
			jobDetails.setCtcOffered(obj[11] == null ? null : (Integer) obj[11]);
			companyJobsAndDetailsEntity.setCompanyName(obj[12] == null ? null : (String) obj[12]);
			companyJobsAndDetailsEntity.setCompanyDescription(obj[13] == null ? null : (String) obj[13]);
			companyJobsAndDetailsEntity.setCompanyJobDetailsEntity(jobDetails);
			companyJobsAndDetailsEntities.add(companyJobsAndDetailsEntity);

		}

		response.setCompanyjobsAndDetailsList(companyJobsAndDetailsEntities);

		return response;
	}

	@Override
	public JobSeekerDetailsResponse getAllJobSeekersAppliedForAJob(BigInteger jobId) {
		JobSeekerDetailsResponse response = new JobSeekerDetailsResponse();
		List<JobApplicationHistoryEntity> jobApplicationHistoryList = jobApplicationHistoryRepo.findByJobId(jobId);

		if (Objects.isNull(jobApplicationHistoryList) || jobApplicationHistoryList.isEmpty()) {

			response.addValidationError(new ValidationError(ErrorCodes.INVALID_JOB_ID.getCode(),
					ErrorCodes.INVALID_JOB_ID.getDescription(), "jobId", jobId));
			return response;
		}

		List<BigInteger> jobSeekerIds = jobApplicationHistoryList.stream().distinct().map(e -> {
			return e.getJobSeekerId();
		}).collect(Collectors.toList());

		List<UserEntity> jobSeekers = userRepository.findByUserIdIn(jobSeekerIds);

		List<JobSeekerDetails> jobSeekerDetailList = jobSeekers.stream().map(e -> {
			JobSeekerDetails jsd = new JobSeekerDetails();
			jsd.setEmail(e.getEmail());
			jsd.setFirstName(e.getFirstName());
			jsd.setLastName(e.getLastName());
			jsd.setMobileNumber(e.getMobileNumber());
			jsd.setJobSeekerId(e.getUserId());
			return jsd;
		}).collect(Collectors.toList());

		response.setJobSeekerDetails(jobSeekerDetailList);
		response.setSuccess(true);
		response.setMessage("Fetched the details successfully");
		return response;
	}

	@Override
	public CommonServiceResponse acceptOrRejectCandidateJobApplication(
			RecruiterActionsOnJobApplicationRequest recruiterActionsOnJobApplicationRequest) {

		CommonServiceResponse response = new CommonServiceResponse();
		if (Objects.isNull(recruiterActionsOnJobApplicationRequest.getApplicationAccepted())
				|| !recruiterActionsOnJobApplicationRequest.validApplicationAcceptedField()) {
			response.addValidationError(new ValidationError(ErrorCodes.INVALID_INPUT_PARAMETER.getCode(),
					ErrorCodes.INVALID_INPUT_PARAMETER.getDescription(), "applicationAccepted",
					recruiterActionsOnJobApplicationRequest.getApplicationAccepted()));
			response.setSuccess(BusinessConstants.FALSE);
			return response;
		}
		Optional<JobApplicationHistoryEntity> jobApplicationHistoryOpt = jobApplicationHistoryRepo
				.findByJobIdAndJobSeekerId(recruiterActionsOnJobApplicationRequest.getJobId(),
						recruiterActionsOnJobApplicationRequest.getJobSeekerId());

		if (jobApplicationHistoryOpt.isPresent()) {
			JobApplicationHistoryEntity jobApplicationHistory = jobApplicationHistoryOpt.get();
			jobApplicationHistory
					.setApplicataionAccepted(recruiterActionsOnJobApplicationRequest.getApplicationAccepted());
			jobApplicationHistoryRepo.save(jobApplicationHistory);
			response.setMessage("Successfully updated the job seeker application status");
			response.setSuccess(BusinessConstants.TRUE);
			return response;
		}

		response.addValidationError(new ValidationError(ErrorCodes.JOB_APPLICAION_DO_NOT_EXIST.getCode(),
				ErrorCodes.JOB_APPLICAION_DO_NOT_EXIST.getDescription(), "jobId",
				recruiterActionsOnJobApplicationRequest.getJobId()));
		response.setSuccess(BusinessConstants.FALSE);
		return response;
	}
}