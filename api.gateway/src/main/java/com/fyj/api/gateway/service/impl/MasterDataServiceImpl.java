package com.fyj.api.gateway.service.impl;

import java.util.Objects;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fyj.api.gateway.common.BusinessConstants;
import com.fyj.api.gateway.common.CommonServiceResponse;
import com.fyj.api.gateway.common.ErrorCodes;
import com.fyj.api.gateway.common.ValidationError;
import com.fyj.api.gateway.domain.master.CompanyMasterAddRequest;
import com.fyj.api.gateway.domain.master.DegreeMasterAddRequest;
import com.fyj.api.gateway.domain.master.InstitutionMasterAddRequest;
import com.fyj.api.gateway.entity.CompanyMasterEntity;
import com.fyj.api.gateway.entity.DegreeMasterEntity;
import com.fyj.api.gateway.entity.InstitutionMasterEntity;
import com.fyj.api.gateway.entity.UserEntity;
import com.fyj.api.gateway.repo.CompanyMasterRepository;
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
	@Autowired
	private CompanyMasterRepository companyMasterRepository;

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
			degreeMasterEntity.setDegreeDescription(degreeMasterAddRequest.getDegreeDescription() != null
					? degreeMasterAddRequest.getDegreeDescription()
					: degreeMasterEntity.getDegreeDescription());
			degreeMasterRepository.save(degreeMasterEntity);
		} else {
			response.setSuccess(BusinessConstants.FALSE);
			response.addValidationError(
					new ValidationError(ErrorCodes.INVALID_INPUT_PARAMETER.getCode(), null, null, degreeMasterEntity));
			response.setMessage("Successfully edited the degree details");
		}

		return response;
	}

	public CommonServiceResponse addInstitution(@Valid InstitutionMasterAddRequest institutionMasterAddRequest) {
		CommonServiceResponse response = new CommonServiceResponse();

		UserEntity userEntity = userRepository.findByLoginIdAndActive(BusinessConstants.ADMIN,
				BusinessConstants.ACTIVE);

		if (Objects.isNull(userEntity)
				|| !institutionMasterAddRequest.getLoginId().equalsIgnoreCase(BusinessConstants.ADMIN)) {
			response.addValidationError(new ValidationError(ErrorCodes.INVALID_USER_ID.getCode(),
					ErrorCodes.INVALID_USER_ID.getDescription(), "loginId", institutionMasterAddRequest.getLoginId()));
			response.setSuccess(BusinessConstants.FALSE);
			return response;
		}

		InstitutionMasterEntity institutionMasterEntity = institutionMasterRepository
				.findByInstitutionName(institutionMasterAddRequest.getInstitutionName());

		if (institutionMasterEntity == null) {

			institutionMasterEntity = new InstitutionMasterEntity();
			institutionMasterEntity.setAddress(institutionMasterAddRequest.getAddress());
			institutionMasterEntity.setInstitutionName(institutionMasterAddRequest.getInstitutionName());
			institutionMasterEntity.setLocation(institutionMasterAddRequest.getLocation());
			institutionMasterEntity.setPinCode(institutionMasterAddRequest.getPinCode());

			institutionMasterRepository.save(institutionMasterEntity);
			response.setSuccess(BusinessConstants.TRUE);
			response.setMessage("Successfully added the instituttion details");
		} else {
			response.setSuccess(BusinessConstants.FALSE);
			response.addValidationError(new ValidationError(ErrorCodes.INSTITUTION_ALREADY_EXIST.getCode(),
					ErrorCodes.INSTITUTION_ALREADY_EXIST.getDescription(), "institutionName",
					institutionMasterAddRequest.getInstitutionName()));
		}

		return response;

	}

	public CommonServiceResponse editInstitution(@Valid InstitutionMasterAddRequest institutionMasterAddRequest) {
		CommonServiceResponse response = new CommonServiceResponse();

		UserEntity userEntity = userRepository.findByLoginIdAndActive(BusinessConstants.ADMIN,
				BusinessConstants.ACTIVE);

		if (Objects.isNull(userEntity)
				|| !institutionMasterAddRequest.getLoginId().equalsIgnoreCase(BusinessConstants.ADMIN)) {
			response.addValidationError(new ValidationError(ErrorCodes.INVALID_USER_ID.getCode(),
					ErrorCodes.INVALID_USER_ID.getDescription(), "loginId", institutionMasterAddRequest.getLoginId()));
			response.setSuccess(BusinessConstants.FALSE);
			return response;
		}

		response.setSuccess(BusinessConstants.TRUE);
		response.setMessage("Successfully edited the degree details");

		InstitutionMasterEntity institutionMasterEntity = institutionMasterRepository
				.findByInstitutionName(institutionMasterAddRequest.getInstitutionName());

		if (institutionMasterEntity != null) {
			institutionMasterEntity.setAddress(
					institutionMasterAddRequest.getAddress() != null ? institutionMasterAddRequest.getAddress()
							: institutionMasterEntity.getAddress());
			institutionMasterEntity.setLocation(
					institutionMasterAddRequest.getLocation() != null ? institutionMasterAddRequest.getLocation()
							: institutionMasterEntity.getLocation());
			institutionMasterEntity.setPinCode(
					institutionMasterAddRequest.getPinCode() != null ? institutionMasterAddRequest.getPinCode()
							: institutionMasterEntity.getPinCode());
			institutionMasterRepository.save(institutionMasterEntity);
		} else {
			response.setSuccess(BusinessConstants.FALSE);
			response.addValidationError(new ValidationError(ErrorCodes.INVALID_INPUT_PARAMETER.getCode(), null, null,
					institutionMasterEntity));
			response.setMessage("Successfully edited the institution details");
		}

		return response;
	}

	public CommonServiceResponse addCompany(@Valid CompanyMasterAddRequest companyMasterAddRequest) {
		CommonServiceResponse response = new CommonServiceResponse();

		UserEntity userEntity = userRepository.findByLoginIdAndActive(BusinessConstants.ADMIN,
				BusinessConstants.ACTIVE);

		if (Objects.isNull(userEntity)
				|| !companyMasterAddRequest.getLoginId().equalsIgnoreCase(BusinessConstants.ADMIN)) {
			response.addValidationError(new ValidationError(ErrorCodes.INVALID_USER_ID.getCode(),
					ErrorCodes.INVALID_USER_ID.getDescription(), "loginId", companyMasterAddRequest.getLoginId()));
			response.setSuccess(BusinessConstants.FALSE);
			return response;
		}

		CompanyMasterEntity companyMasterEntity = companyMasterRepository
				.findByCompanyName(companyMasterAddRequest.getCompanyName());

		if (companyMasterEntity == null) {
			companyMasterEntity = new CompanyMasterEntity();
			companyMasterEntity.setCompanyName(companyMasterAddRequest.getCompanyName());

			companyMasterEntity.setCompanyDescription(companyMasterAddRequest.getCompanyDescription() != null
					? companyMasterAddRequest.getCompanyDescription()
					: "");
			companyMasterRepository.save(companyMasterEntity);
		} else {
			response.setSuccess(BusinessConstants.FALSE);
			response.addValidationError(new ValidationError(ErrorCodes.COMPANY_ALREADY_EXIST.getCode(),
					ErrorCodes.COMPANY_ALREADY_EXIST.getDescription(), "companyName",
					companyMasterAddRequest.getCompanyName()));
			response.setMessage("Successfully added the company details");
		}

		return response;
	}

	public CommonServiceResponse editCompany(CompanyMasterAddRequest companyMasterAddRequest) {
		CommonServiceResponse response = new CommonServiceResponse();
		UserEntity userEntity = userRepository.findByLoginIdAndActive(BusinessConstants.ADMIN,
				BusinessConstants.ACTIVE);

		if (Objects.isNull(userEntity)
				|| !companyMasterAddRequest.getLoginId().equalsIgnoreCase(BusinessConstants.ADMIN)) {
			response.addValidationError(new ValidationError(ErrorCodes.INVALID_USER_ID.getCode(),
					ErrorCodes.INVALID_USER_ID.getDescription(), "loginId", companyMasterAddRequest.getLoginId()));
			response.setSuccess(BusinessConstants.FALSE);
			return response;
		}

		CompanyMasterEntity companyMasterEntity = companyMasterRepository
				.findByCompanyName(companyMasterAddRequest.getCompanyName());

		if (companyMasterEntity != null) {
			companyMasterEntity.setCompanyName(
					companyMasterAddRequest.getCompanyName() != null ? companyMasterAddRequest.getCompanyName()
							: companyMasterEntity.getCompanyName());

			companyMasterEntity.setCompanyDescription(companyMasterAddRequest.getCompanyDescription() != null
					? companyMasterAddRequest.getCompanyDescription()
					: companyMasterEntity.getCompanyDescription());

			companyMasterRepository.save(companyMasterEntity);

		} else {
			response.setSuccess(BusinessConstants.FALSE);
			response.addValidationError(new ValidationError(ErrorCodes.INVALID_INPUT_PARAMETER.getCode(), null, null,
					companyMasterAddRequest));
			response.setMessage("Successfully edited the company details");
		}

		return response;
	}

}