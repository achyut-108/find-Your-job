package com.jobseeker.service;

import com.jobseeker.domain.signup.NewUserSignUpRequest;
import com.jobseeker.domain.signup.NewUserSignUpResponse;
import com.jobseeker.domain.signup.UserBasicProfileDetails;

public interface SignUpService {

	public NewUserSignUpResponse signUp(NewUserSignUpRequest newJoineeSignUpRequest);
	public UserBasicProfileDetails viewProfile(NewUserSignUpRequest newJoineeSignUpRequest);
	public NewUserSignUpResponse editProfile(NewUserSignUpRequest newJoineeSignUpRequest);
}
