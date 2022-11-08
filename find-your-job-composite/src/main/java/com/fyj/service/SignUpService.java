package com.fyj.service;

import com.fyj.domain.signup.NewUserSignUpRequest;
import com.fyj.domain.signup.NewUserSignUpResponse;
import com.fyj.domain.signup.UserBasicProfileDetails;

public interface SignUpService {

	public NewUserSignUpResponse signUp(NewUserSignUpRequest newJoineeSignUpRequest);
	public UserBasicProfileDetails viewProfile(NewUserSignUpRequest newJoineeSignUpRequest);
	public NewUserSignUpResponse editProfile(NewUserSignUpRequest newJoineeSignUpRequest);
}
