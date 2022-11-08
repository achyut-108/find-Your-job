package com.recruiter.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.recruiter.common.BusinessConstants;
import com.recruiter.common.ErrorCodes;
import com.recruiter.common.ValidationError;
import com.recruiter.domain.job.JobDetailsRequest;
import com.recruiter.domain.job.JobDetailsResponse;
import com.recruiter.domain.job.JobSearchResponse;
import com.recruiter.entity.CompanyJobsAndDetailsEntity;
import com.recruiter.entity.CompanyJobsDetailsEntity;
import com.recruiter.entity.CompanyJobsEntity;
import com.recruiter.entity.CompanyMasterEntity;
import com.recruiter.entity.UserEntity;
import com.recruiter.repo.CompanyJobsAndDetailsRepository;
import com.recruiter.repo.CompanyJobsDetailsRepository;
import com.recruiter.repo.CompanyJobsRepository;
import com.recruiter.repo.CompanyMasterRepository;
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
	public JobDetailsResponse deleteJobDetails(JobDetailsRequest jobDetailsRequest) {

		JobDetailsResponse jobDetailsResponse = new JobDetailsResponse();
		UserEntity userEntity = userRepository.findByLoginIdAndActive(jobDetailsRequest.getLoginId(),
				BusinessConstants.ACTIVE);

		if (Objects.isNull(userEntity)) {
			jobDetailsResponse.addValidationError(new ValidationError(ErrorCodes.INVALID_USER_ID.getCode(),
					ErrorCodes.INVALID_USER_ID.getDescription(), "loginId", jobDetailsRequest.getLoginId()));
			return jobDetailsResponse;
		}

		if (Objects.isNull(jobDetailsRequest.getJobId())) {
			jobDetailsResponse.addValidationError(new ValidationError(ErrorCodes.INVALID_JOB_ID.getCode(),
					ErrorCodes.INVALID_JOB_ID.getDescription(), "jobId", jobDetailsRequest.getJobId()));
			return jobDetailsResponse;
		}

		companyJobsDetailsRepository.deleteByJobId(jobDetailsRequest.getJobId());
		companyJobsRepository.deleteById(jobDetailsRequest.getJobId());

		jobDetailsResponse.setMessage("Successfully deleted the job details");
		jobDetailsResponse.setSuccess(true);

		return jobDetailsResponse;

	}

	@Override
	public JobSearchResponse getAllJobs() {
		List<CompanyJobsAndDetailsEntity> companyJobAndDetails = (List<CompanyJobsAndDetailsEntity>) companyJobsAndDetailsRepository
				.findAll();

		JobSearchResponse jobSearchResponse = new JobSearchResponse();
		jobSearchResponse.setMessage("Successfully fetched the posted jobs");
		jobSearchResponse.setSuccess(true);
		return jobSearchResponse;
	}
}