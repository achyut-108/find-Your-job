package com.fyj.api.gateway.rest;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fyj.api.gateway.domain.signup.NewUserSignUpRequest;
import com.fyj.api.gateway.domain.signup.NewUserSignUpResponse;
import com.fyj.api.gateway.domain.signup.UserBasicProfileDetails;
import com.fyj.api.gateway.service.SignUpService;

@RestController
@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping("/")
public class SignUpController {

	private static final Logger log = LoggerFactory.getLogger(SignUpController.class);

	@Autowired
	private SignUpService signUpService;

	@PostMapping(value = "/sign-up/post", produces = "application/json")
	public NewUserSignUpResponse signUp(@Valid @RequestBody NewUserSignUpRequest newUserSignUpRequest) {
		log.info("request : {}", newUserSignUpRequest.toString());
		return signUpService.signUp(newUserSignUpRequest);
	}
	
	@GetMapping(value = "/profile/view/get", produces = "application/json")
	public UserBasicProfileDetails viewProfile(@Valid @RequestBody NewUserSignUpRequest newUserSignUpRequest) {
		log.info("request : {}", newUserSignUpRequest.toString());
		return signUpService.viewProfile(newUserSignUpRequest);
	}
	
	@PostMapping(value = "/profile/edit/post", produces = "application/json")
	public NewUserSignUpResponse editProfile(@Valid @RequestBody NewUserSignUpRequest newUserSignUpRequest) {
		log.info("request : {}", newUserSignUpRequest.toString());
		return signUpService.editProfile(newUserSignUpRequest);
	}	
}