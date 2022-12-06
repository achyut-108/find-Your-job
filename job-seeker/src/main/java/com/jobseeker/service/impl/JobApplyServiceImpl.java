package com.jobseeker.service.impl;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobseeker.common.BusinessConstants;
import com.jobseeker.common.CommonServiceRequest;
import com.jobseeker.common.ErrorCodes;
import com.jobseeker.common.ValidationError;
import com.jobseeker.domain.jobapply.JobApplicationDetails;
import com.jobseeker.domain.jobapply.JobAppliedStatDetails;
import com.jobseeker.domain.jobapply.JobApplyRequest;
import com.jobseeker.domain.jobapply.JobApplyResponse;
import com.jobseeker.domain.jobapply.JobsAppliedResponse;
import com.jobseeker.domain.jobapply.JobsAppliedStatisticsResponse;
import com.jobseeker.domain.resume.JobApplicationStatusRequest;
import com.jobseeker.domain.resume.JobApplicationStatusResponse;
import com.jobseeker.entity.CompanyJobsEntity;
import com.jobseeker.entity.JobApplicationHistoryEntity;
import com.jobseeker.entity.UserEntity;
import com.jobseeker.repo.CompanyJobsAndDetailsRepository;
import com.jobseeker.repo.CompanyJobsDetailsRepository;
import com.jobseeker.repo.CompanyJobsRepository;
import com.jobseeker.repo.CompanyMasterRepository;
import com.jobseeker.repo.JobApplicationHistoryRepo;
import com.jobseeker.repo.UserRepository;
import com.jobseeker.service.JobApplyService;

@Service
public class JobApplyServiceImpl implements JobApplyService {

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

	@Override
	public JobApplyResponse applyToAJob(JobApplyRequest jobApplyRequest) {
		JobApplyResponse jobApplyResponse = new JobApplyResponse();
		UserEntity userEntity = userRepository.findByLoginIdAndActive(jobApplyRequest.getLoginId(),
				BusinessConstants.ACTIVE);

		if (Objects.isNull(userEntity)) {
			jobApplyResponse.addValidationError(new ValidationError(ErrorCodes.INVALID_USER_ID.getCode(),
					ErrorCodes.INVALID_USER_ID.getDescription(), "loginId", jobApplyRequest.getLoginId()));
			jobApplyResponse.setSuccess(BusinessConstants.FALSE);
			return jobApplyResponse;
		}

		Optional<CompanyJobsEntity> companyJobOpt = companyJobsRepository.findById(jobApplyRequest.getJobId());

		if (!companyJobOpt.isPresent() || !companyJobOpt.get().getActive().equalsIgnoreCase(BusinessConstants.ACTIVE)) {

			jobApplyResponse.addValidationError(new ValidationError(ErrorCodes.JOB_DOES_NOT_EXIST.getCode(),
					ErrorCodes.JOB_DOES_NOT_EXIST.getDescription(), "jobId", jobApplyRequest.getJobId()));
			jobApplyResponse.setSuccess(BusinessConstants.FALSE);
			return jobApplyResponse;

		}

		Optional<JobApplicationHistoryEntity> jobApplicationhistOpt = jobApplicationHistoryRepo
				.findByjobIdAndJobSeekerId(jobApplyRequest.getJobId(), userEntity.getUserId());

		if (jobApplicationhistOpt.isPresent()) {
			jobApplyResponse.addValidationError(new ValidationError(ErrorCodes.ALREADY_APPLIED_TO_JOB.getCode(),
					ErrorCodes.ALREADY_APPLIED_TO_JOB.getDescription(), "jobId", jobApplyRequest.getJobId()));
			jobApplyResponse.setSuccess(BusinessConstants.FALSE);
			return jobApplyResponse;
		}

		CompanyJobsEntity companyJobsEntity = companyJobOpt.get();
		JobApplicationHistoryEntity jobApplicationHistoryEntity = new JobApplicationHistoryEntity();
		jobApplicationHistoryEntity.setActive(BusinessConstants.ACTIVE);
		jobApplicationHistoryEntity.setCreationDate(new Date());
		jobApplicationHistoryEntity.setJobId(companyJobsEntity.getJobId());
		jobApplicationHistoryEntity.setJobSeekerId(userEntity.getUserId());
		jobApplicationHistoryRepo.save(jobApplicationHistoryEntity);

		jobApplyResponse.setMessage("Applied to the job Successfully");
		jobApplyResponse.setSuccess(true);

		return jobApplyResponse;
	}

	@Override
	public JobsAppliedResponse jobsApplied(String loginId) {

		JobsAppliedResponse jobAppliedResponse = new JobsAppliedResponse();
		UserEntity userEntity = userRepository.findByLoginIdAndActive(loginId, BusinessConstants.ACTIVE);

		if (Objects.isNull(userEntity)) {
			jobAppliedResponse.addValidationError(new ValidationError(ErrorCodes.INVALID_USER_ID.getCode(),
					ErrorCodes.INVALID_USER_ID.getDescription(), "loginId", loginId));
			return jobAppliedResponse;
		}

		List<Object[]> jobAppliedResultSet = jobApplicationHistoryRepo.jobsAppliedByAjobSeeker(userEntity.getUserId());
		List<JobApplicationDetails> jobsApplied = new ArrayList<>();

		for (Object[] obj : jobAppliedResultSet) {
			JobApplicationDetails jobApplicationDetails = new JobApplicationDetails();
			jobApplicationDetails
					.setJobId(obj[0] == null ? null : BigInteger.valueOf((Long.valueOf(obj[0].toString()))));
			jobApplicationDetails.setCompanyId(obj[1] == null ? null : (Integer) obj[1]);
			jobApplicationDetails.setJobTitle(obj[2] == null ? null : (String) obj[2]);
			jobApplicationDetails.setJobDescription(obj[3] == null ? null : (String) obj[3]);
			jobApplicationDetails.setJobTypeId(obj[4] == null ? null : (Integer) obj[4]);
			jobApplicationDetails
					.setJobType(BusinessConstants.getJobTypeMap().get(jobApplicationDetails.getJobTypeId()));
			jobApplicationDetails.setCompanyName(obj[5] == null ? null : (String) obj[5]);
			jobApplicationDetails.setCompanyDescription(obj[6] == null ? null : (String) obj[6]);
			jobApplicationDetails.setAppliedDate(obj[7] == null ? null : (Date) obj[7]);
			jobApplicationDetails.setActive(obj[8] == null ? null : (String) obj[8]);
			jobApplicationDetails
					.setJobApplicationId(obj[9] == null ? null : BigInteger.valueOf((Long.valueOf(obj[9].toString()))));

			jobsApplied.add(jobApplicationDetails);

		}

		jobAppliedResponse.setJobsApplied(jobsApplied);
		return jobAppliedResponse;
	}

	@Override
	public JobApplicationStatusResponse getJobApplicationStatus(
			JobApplicationStatusRequest jobApplicationStatusRequest) {
		JobApplicationStatusResponse jobApplicationStatusResponse = new JobApplicationStatusResponse();

		Optional<JobApplicationHistoryEntity> jobApplicationhistoryOpt = jobApplicationHistoryRepo
				.findById(jobApplicationStatusRequest.getJobApplicationId());

		if (!jobApplicationhistoryOpt.isPresent()) {
			jobApplicationStatusResponse
					.addValidationError(new ValidationError(ErrorCodes.JOB_APPLICATION_DOES_NOT_EXIST.getCode(),
							ErrorCodes.JOB_APPLICATION_DOES_NOT_EXIST.getDescription(), "jobApplicationId",
							jobApplicationStatusRequest.getJobApplicationId()));
			jobApplicationStatusResponse.setSuccess(BusinessConstants.FALSE);
			return jobApplicationStatusResponse;

		}

		JobApplicationHistoryEntity jobApplicationHistoryEntity = jobApplicationhistoryOpt.get();
		UserEntity userEntity = userRepository.findByLoginIdAndActive(jobApplicationStatusRequest.getLoginId(),
				BusinessConstants.ACTIVE);
		if (Objects.isNull(userEntity)
				|| jobApplicationHistoryEntity.getJobSeekerId().compareTo(userEntity.getUserId()) != 0) {
			jobApplicationStatusResponse.addValidationError(new ValidationError(ErrorCodes.INVALID_USER_ID.getCode(),
					ErrorCodes.INVALID_USER_ID.getDescription(), "loginId", jobApplicationStatusRequest.getLoginId()));
			jobApplicationStatusResponse.setSuccess(BusinessConstants.FALSE);
			return jobApplicationStatusResponse;
		}

		jobApplicationStatusResponse.setApplicationAccepted(jobApplicationHistoryEntity.getApplicataionAccepted());
		jobApplicationStatusResponse.setApplicationViewed(jobApplicationHistoryEntity.getApplicationViewed());
		jobApplicationStatusResponse.setSuccess(BusinessConstants.TRUE);
		jobApplicationStatusResponse.setMessage("Successfully fetched the job application status");

		return jobApplicationStatusResponse;
	}

	@Override
	public JobsAppliedStatisticsResponse getJobAppliedStatistics(@Valid CommonServiceRequest commonServiceRequest) {

		JobsAppliedStatisticsResponse response = new JobsAppliedStatisticsResponse();
		UserEntity userEntity = userRepository.findByLoginIdAndActive(BusinessConstants.ADMIN,
				BusinessConstants.ACTIVE);

		if (Objects.isNull(userEntity)
				|| !commonServiceRequest.getLoginId().equalsIgnoreCase(BusinessConstants.ADMIN)) {
			response.addValidationError(new ValidationError(ErrorCodes.INVALID_USER_ID.getCode(),
					ErrorCodes.INVALID_USER_ID.getDescription(), "loginId", commonServiceRequest.getLoginId()));
			response.setSuccess(BusinessConstants.FALSE);
			return response;
		}

		List<Object[]> jobAppliedStats = jobApplicationHistoryRepo.jobsAppliedStatistics();

		List<JobAppliedStatDetails> jobsAppliedStatDetails = new ArrayList<>();

		long totalJobsApplied = 0;
		BigInteger hundred = new BigInteger("100");
		for (Object[] obj : jobAppliedStats) {
			JobAppliedStatDetails jobAppliedStatDetails = new JobAppliedStatDetails();
			jobAppliedStatDetails.setCountOfJobSeekers(
					obj[0] == null ? null : Long.valueOf(obj[0].toString()));
			totalJobsApplied = totalJobsApplied + jobAppliedStatDetails.getCountOfJobSeekers();
			jobAppliedStatDetails
					.setJobId(obj[1] == null ? null : BigInteger.valueOf((Long.valueOf(obj[1].toString()))));

			Optional<CompanyJobsEntity> companyJobOpt = companyJobsRepository
					.findById(jobAppliedStatDetails.getJobId());

			if (companyJobOpt.isPresent()) {
				CompanyJobsEntity companyJobsEntity = companyJobOpt.get();
				jobAppliedStatDetails.setCompanyId(companyJobsEntity.getCompanyId());
				jobAppliedStatDetails.setJobTitle(companyJobsEntity.getJobTitle());
				jobAppliedStatDetails.setJobDescription(companyJobsEntity.getJobDescription());
				jobAppliedStatDetails.setJobPostedBy(companyJobsEntity.getPostedBy());
				jobAppliedStatDetails.setJobTypeId(companyJobsEntity.getJobTypeId());
				jobAppliedStatDetails
						.setJobType(BusinessConstants.getJobTypeMap().get(companyJobsEntity.getJobTypeId()));
			}

			jobsAppliedStatDetails.add(jobAppliedStatDetails);

		}

		
		for(JobAppliedStatDetails jobAppliedStatDetail : jobsAppliedStatDetails) {
			long percentage = (100 / (totalJobsApplied)) * (jobAppliedStatDetail.getCountOfJobSeekers());
			jobAppliedStatDetail.setJobAppliedPercentage(percentage);
		}

		response.setJobsApplied(jobsAppliedStatDetails);
		response.setSuccess(BusinessConstants.TRUE);
		response.setMessage("Successfully fetched the job stat details");
		return response;
	}

}