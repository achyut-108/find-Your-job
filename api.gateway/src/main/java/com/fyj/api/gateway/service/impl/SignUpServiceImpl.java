package com.fyj.api.gateway.service.impl;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fyj.api.gateway.common.BusinessConstants;
import com.fyj.api.gateway.common.CommonServiceResponse;
import com.fyj.api.gateway.common.ErrorCodes;
import com.fyj.api.gateway.common.UserTypeValidator;
import com.fyj.api.gateway.common.ValidationError;
import com.fyj.api.gateway.domain.signup.NewUserSignUpRequest;
import com.fyj.api.gateway.domain.signup.NewUserSignUpResponse;
import com.fyj.api.gateway.domain.signup.UserBasicProfileDetails;
import com.fyj.api.gateway.entity.CompanyMasterEntity;
import com.fyj.api.gateway.entity.UserEntity;
import com.fyj.api.gateway.repo.CompanyMasterRepository;
import com.fyj.api.gateway.repo.UserRepository;
import com.fyj.api.gateway.service.SignUpService;

@Service
public class SignUpServiceImpl implements SignUpService {

	@Autowired
	private UserRepository userRepository;
	@Autowired
	private CompanyMasterRepository companyMasterRepository;

	/**
	 * To do : make a interface with validate method and every service class should
	 * implement this
	 * 
	 * The validate would be generic such that as per the service class the
	 * appropriate object is returned (making use of reflection)
	 */
	@Override
	public NewUserSignUpResponse signUp(NewUserSignUpRequest newSignUpRequest) {

		NewUserSignUpResponse newJoineeSignUpResponse = new NewUserSignUpResponse();

		if (!UserTypeValidator.INSTANCE.validate(newSignUpRequest.getUserType())) {
			newJoineeSignUpResponse.addValidationError(
					new ValidationError("", "user Type is Invalid", "userType", newSignUpRequest.getUserType()));
		}

		UserEntity userEntity = new UserEntity();
		userEntity.setEmail(newSignUpRequest.getEmail());
		userEntity.setFirstName(newSignUpRequest.getFirstName());
		userEntity.setLastName(newSignUpRequest.getLastName());
		userEntity.setLoginAttempt(null);
		userEntity.setMobileNumber(newSignUpRequest.getMobileNumber());
		userEntity.setPassword(newSignUpRequest.getPassword());
		userEntity.setLoginId(newSignUpRequest.getLoginId());
		userEntity.setUserTypeId(newSignUpRequest.getUserType());

		CompanyMasterEntity companyMasterEntity = null;
		if (newSignUpRequest.getUserType().compareTo(2) == 0) {
			// user type is job_poster

			if (Objects.isNull(newSignUpRequest.getCompanyName())
					|| newSignUpRequest.getCompanyName().trim().isEmpty()) {
				newJoineeSignUpResponse.addValidationError(new ValidationError("", "The company name is Invalid",
						"companyName", newSignUpRequest.getCompanyName()));
			}

			companyMasterEntity = new CompanyMasterEntity();
			companyMasterEntity.setCompanyDescription(newSignUpRequest.getCompanyDescription());
			companyMasterEntity.setCompanyName(newSignUpRequest.getCompanyName());

		}

		if (Objects.isNull(newJoineeSignUpResponse.getValidationErrors()) || 
				newJoineeSignUpResponse.getValidationErrors().isEmpty()) {
			userEntity = userRepository.save(userEntity);

			if (Objects.nonNull(companyMasterEntity)) {
				companyMasterEntity.setUserId(userEntity.getUserId());
				companyMasterRepository.save(companyMasterEntity);
			}

			newJoineeSignUpResponse.setSuccess(true);
			newJoineeSignUpResponse.setMessage("user " + newSignUpRequest.getLoginId() + " successfully registered");
		}

		return newJoineeSignUpResponse;

	}

	@Override
	public UserBasicProfileDetails viewProfile(NewUserSignUpRequest newJoineeSignUpRequest) {

		UserEntity userEntity = userRepository.findByLoginIdAndActive(newJoineeSignUpRequest.getLoginId(),
				BusinessConstants.ACTIVE);

		UserBasicProfileDetails userBasicProfileDetails = new UserBasicProfileDetails();
		userBasicProfileDetails.setEmail(userEntity.getEmail());
		userBasicProfileDetails.setFirstName(userEntity.getFirstName());
		userBasicProfileDetails.setLastName(userEntity.getLastName());
		userBasicProfileDetails.setLoginId(userEntity.getLoginId());
		userBasicProfileDetails.setMobileNumber(userEntity.getMobileNumber());
		userBasicProfileDetails.setUserId(userEntity.getUserId());
		userBasicProfileDetails.setUserType(UserTypeValidator.INSTANCE.getUserType(userEntity.getUserTypeId()));
		return userBasicProfileDetails;
	}

	public NewUserSignUpResponse editProfile(NewUserSignUpRequest newJoineeSignUpRequest) {
		NewUserSignUpResponse newUserSignUpResponse = new NewUserSignUpResponse();
		UserEntity userEntity = userRepository.findByLoginIdAndActive(newJoineeSignUpRequest.getLoginId(),
				BusinessConstants.ACTIVE);

		if (Objects.nonNull(userEntity)) {
			userEntity.setEmail(newJoineeSignUpRequest.getEmail());
			userEntity.setFirstName(newJoineeSignUpRequest.getFirstName());
			userEntity.setLastName(newJoineeSignUpRequest.getLastName());
			userEntity.setLoginId(newJoineeSignUpRequest.getLoginId());
			userEntity.setMobileNumber(newJoineeSignUpRequest.getMobileNumber());
			userRepository.save(userEntity);
			newUserSignUpResponse.setSuccess(true);
			newUserSignUpResponse.setMessage("User Details updated");
		} else {
			newUserSignUpResponse.setSuccess(false);
			newUserSignUpResponse.setMessage("Invalid user details provided : " + newJoineeSignUpRequest.getLoginId());
		}

		return newUserSignUpResponse;
	}
	
	@Override
	public CommonServiceResponse validateUserId(String userId) {
		UserEntity user = userRepository.findByLoginIdAndActive(userId, BusinessConstants.ACTIVE);
		
		CommonServiceResponse response = new CommonServiceResponse();
		
		if(Objects.nonNull(user)) {
			response.addValidationError(ErrorCodes.USER_ID_ALREADY_EXIST.getCode(), ErrorCodes.USER_ID_ALREADY_EXIST.getDescription(), "userId", userId);
			return response;
		}
		response.setSuccess(true);
		return response;
		
	}
	
	@Override
	public CommonServiceResponse validateEmailId(String userId, String emailId) {
		UserEntity user = userRepository.findByLoginIdAndActive(userId, BusinessConstants.ACTIVE);
		
		CommonServiceResponse response = new CommonServiceResponse();
		
		if(Objects.nonNull(user) && user.getEmail().equalsIgnoreCase(emailId)) {
			response.addValidationError(ErrorCodes.EMAIL_ID_ALREADY_EXIST.getCode(), ErrorCodes.EMAIL_ID_ALREADY_EXIST.getDescription(), "emailId", emailId);
			return response;
		}
	
		response.setSuccess(true);
		return response;
		
	}
	
}	