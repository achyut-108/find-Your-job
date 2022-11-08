package com.recruiter.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.recruiter.domain.master.DegreeMasterResponse;
import com.recruiter.domain.master.InstitutionMasterResponse;
import com.recruiter.domain.master.JobTypeResponse;
import com.recruiter.entity.DegreeMasterEntity;
import com.recruiter.entity.InstitutionMasterEntity;
import com.recruiter.entity.JobTypeMasterEntity;
import com.recruiter.repo.DegreeMasterRepository;
import com.recruiter.repo.InstitutionMasterRepository;
import com.recruiter.repo.JobTypeMasterRepository;
import com.recruiter.service.UiUtilityService;

@Service
public class UiUtilityServiceImpl implements UiUtilityService {

	@Autowired
	private DegreeMasterRepository degreeMasterRepository;
	@Autowired
	private InstitutionMasterRepository institutionMasterRepository;
	@Autowired
	private JobTypeMasterRepository jobTypeMasterRepository;

	@Override
	public DegreeMasterResponse getAllDegreeDetails() {

		DegreeMasterResponse degreeMasterResponse = new DegreeMasterResponse();

		List<DegreeMasterEntity> degreeDetails = (List<DegreeMasterEntity>) this.degreeMasterRepository.findAll();

		degreeMasterResponse.setDegreeDetails(degreeDetails);
		degreeMasterResponse.setMessage("Successfully fetched the degree details");
		degreeMasterResponse.setSuccess(true);
		return degreeMasterResponse;
	}

	@Override
	public InstitutionMasterResponse getAllInstitutionDetails() {

		InstitutionMasterResponse institutionMasterResponse = new InstitutionMasterResponse();

		List<InstitutionMasterEntity> institutionDetails = (List<InstitutionMasterEntity>) this.institutionMasterRepository.findAll();
		institutionMasterResponse.setInstitutionDetails(institutionDetails);
		institutionMasterResponse.setMessage("Successfully fetched the institution details");
		institutionMasterResponse.setSuccess(true);
		return institutionMasterResponse;
	}

	@Override
	public JobTypeResponse getAllJobTypeDetails() {
		JobTypeResponse jobTypeResponse = new JobTypeResponse();

		List<JobTypeMasterEntity> jobTypeDetails = (List<JobTypeMasterEntity>) this.jobTypeMasterRepository.findAll();
		jobTypeResponse.setJobTypeDetails(jobTypeDetails);
		jobTypeResponse.setMessage("Successfully fetched the jobType details");
		jobTypeResponse.setSuccess(true);
		return jobTypeResponse;
	}
}