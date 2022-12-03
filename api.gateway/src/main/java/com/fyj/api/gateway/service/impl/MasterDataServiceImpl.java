package com.fyj.api.gateway.service.impl;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fyj.api.gateway.common.BusinessConstants;
import com.fyj.api.gateway.common.CommonServiceResponse;
import com.fyj.api.gateway.common.ErrorCodes;
import com.fyj.api.gateway.common.ValidationError;
import com.fyj.api.gateway.domain.master.DegreeMasterAddRequest;
import com.fyj.api.gateway.entity.DegreeMasterEntity;
import com.fyj.api.gateway.entity.UserEntity;
import com.fyj.api.gateway.repo.DegreeMasterRepository;
import com.fyj.api.gateway.repo.InstitutionMasterRepository;
import com.fyj.api.gateway.repo.JobTypeMasterRepository;
import com.fyj.api.gateway.repo.UserRepository;
import com.fyj.api.gateway.service.MasterDataService;

@Service
public class MasterDataServiceImpl implements MasterDataService {

	@Autowired
	private DegreeMasterRepository degreeMasterRepository;
	@Autowired
	private InstitutionMasterRepository institutionMasterRepository;
	@Autowired
	private JobTypeMasterRepository jobTypeMasterRepository;
	@Autowired
	private UserRepository userRepository;

//	@Override
//	public DegreeMasterResponse getAllDegreeDetails() {
//
//		DegreeMasterResponse degreeMasterResponse = new DegreeMasterResponse();
//
//		List<DegreeMasterEntity> degreeDetails = (List<DegreeMasterEntity>) this.degreeMasterRepository.findAll();
//
//		degreeMasterResponse.setDegreeDetails(degreeDetails);
//		degreeMasterResponse.setMessage("Successfully fetched the degree details");
//		degreeMasterResponse.setSuccess(true);
//		return degreeMasterResponse;
//	}
//
//	@Override
//	public InstitutionMasterResponse getAllInstitutionDetails() {
//
//		InstitutionMasterResponse institutionMasterResponse = new InstitutionMasterResponse();
//
//		List<InstitutionMasterEntity> institutionDetails = (List<InstitutionMasterEntity>) this.institutionMasterRepository.findAll();
//		institutionMasterResponse.setInstitutionDetails(institutionDetails);
//		institutionMasterResponse.setMessage("Successfully fetched the institution details");
//		institutionMasterResponse.setSuccess(true);
//		return institutionMasterResponse;
//	}
//
//	@Override
//	public JobTypeResponse getAllJobTypeDetails() {
//		JobTypeResponse jobTypeResponse = new JobTypeResponse();
//
//		List<JobTypeMasterEntity> jobTypeDetails = (List<JobTypeMasterEntity>) this.jobTypeMasterRepository.findAll();
//		jobTypeResponse.setJobTypeDetails(jobTypeDetails);
//		jobTypeResponse.setMessage("Successfully fetched the jobType details");
//		jobTypeResponse.setSuccess(true);
//		return jobTypeResponse;
//	}

	@Override
	public CommonServiceResponse addDegree(DegreeMasterAddRequest degreeMasterAddRequest) {

		CommonServiceResponse response = new CommonServiceResponse();

		UserEntity userEntity = userRepository.findByLoginIdAndActive(BusinessConstants.ADMIN,
				BusinessConstants.ACTIVE);

		if (Objects.isNull(userEntity)
				|| !degreeMasterAddRequest.getLoginId().equalsIgnoreCase(BusinessConstants.ADMIN)) {
			response.addValidationError(new ValidationError(ErrorCodes.INVALID_USER_ID.getCode(),
					ErrorCodes.INVALID_USER_ID.getDescription(), "loginId", degreeMasterAddRequest.getLoginId()));
			response.setSuccess(BusinessConstants.FALSE);
			return response;
		}

		DegreeMasterEntity degreeMasterEntity = new DegreeMasterEntity();
		degreeMasterEntity.setDegree(degreeMasterAddRequest.getDegree());
		degreeMasterEntity.setDegreeDescription(degreeMasterAddRequest.getDegreeDescription());
		degreeMasterRepository.save(degreeMasterEntity);

		response.setSuccess(BusinessConstants.TRUE);
		response.setMessage("Successfully added the degree details");

		return response;
	}

	@Override
	public CommonServiceResponse editDegree(DegreeMasterAddRequest degreeMasterAddRequest) {
		CommonServiceResponse response = new CommonServiceResponse();

		UserEntity userEntity = userRepository.findByLoginIdAndActive(BusinessConstants.ADMIN,
				BusinessConstants.ACTIVE);

		if (Objects.isNull(userEntity)
				|| !degreeMasterAddRequest.getLoginId().equalsIgnoreCase(BusinessConstants.ADMIN)) {
			response.addValidationError(new ValidationError(ErrorCodes.INVALID_USER_ID.getCode(),
					ErrorCodes.INVALID_USER_ID.getDescription(), "loginId", degreeMasterAddRequest.getLoginId()));
			response.setSuccess(BusinessConstants.FALSE);
			return response;
		}

		response.setSuccess(BusinessConstants.TRUE);
		response.setMessage("Successfully edited the degree details");

		DegreeMasterEntity degreeMasterEntity = degreeMasterRepository.findByDegree(degreeMasterAddRequest.getDegree());

		if (degreeMasterEntity != null) {
			degreeMasterEntity.setDegreeDescription(degreeMasterAddRequest.getDegreeDescription()!=null 
					? degreeMasterAddRequest.getDegreeDescription() : degreeMasterEntity.getDegreeDescription());
			degreeMasterRepository.save(degreeMasterEntity);
		}else {
			response.setSuccess(BusinessConstants.FALSE);
			response.addValidationError(new ValidationError(ErrorCodes.INVALID_INPUT_PARAMETER.getCode(), 
					null, null, degreeMasterEntity));
			response.setMessage("Successfully edited the degree details");
		}

		return response;
	}
}