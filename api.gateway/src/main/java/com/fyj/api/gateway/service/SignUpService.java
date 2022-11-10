package com.fyj.api.gateway.service;

import com.fyj.api.gateway.common.CommonServiceResponse;
import com.fyj.api.gateway.domain.signup.NewUserSignUpRequest;
import com.fyj.api.gateway.domain.signup.NewUserSignUpResponse;
import com.fyj.api.gateway.domain.signup.UserBasicProfileDetails;

public interface SignUpService {

	public NewUserSignUpResponse signUp(NewUserSignUpRequest newJoineeSignUpRequest);
	public UserBasicProfileDetails viewProfile(NewUserSignUpRequest newJoineeSignUpRequest);
	public NewUserSignUpResponse editProfile(NewUserSignUpRequest newJoineeSignUpRequest);
	public CommonServiceResponse validateUserId(String userId);
	public CommonServiceResponse validateEmailId(String userId, String emailId);
}
