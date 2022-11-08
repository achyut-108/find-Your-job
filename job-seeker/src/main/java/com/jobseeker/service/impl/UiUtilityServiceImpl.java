package com.jobseeker.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobseeker.domain.master.DegreeMasterResponse;
import com.jobseeker.domain.master.InstitutionMasterResponse;
import com.jobseeker.domain.master.JobTypeResponse;
import com.jobseeker.entity.DegreeMasterEntity;
import com.jobseeker.entity.InstitutionMasterEntity;
import com.jobseeker.entity.JobTypeMasterEntity;
import com.jobseeker.repo.DegreeMasterRepository;
import com.jobseeker.repo.InstitutionMasterRepository;
import com.jobseeker.repo.JobTypeMasterRepository;
import com.jobseeker.service.UiUtilityService;

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