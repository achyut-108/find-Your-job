package com.fyj.api.gateway.rest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fyj.api.gateway.domain.master.DegreeMasterResponse;
import com.fyj.api.gateway.domain.master.InstitutionMasterResponse;
import com.fyj.api.gateway.domain.master.JobTypeResponse;
import com.fyj.api.gateway.domain.signup.AllUserBasicProfileDetails;
import com.fyj.api.gateway.service.UiUtilityService;

@RestController
@CrossOrigin(origins = "http://localhost:80")
@RequestMapping("/")
public class UiUtilityController {

	private static final Logger log = LoggerFactory.getLogger(UiUtilityController.class);

	@Autowired
	private UiUtilityService uiUtilityService;

	@GetMapping(value = "/ui/getAllDegree/get", produces = "application/json")
	public DegreeMasterResponse getAllDegreeDetails() {
		return uiUtilityService.getAllDegreeDetails();
	}

	@GetMapping(value = "/ui/getAllInstitution/get", produces = "application/json")
	public InstitutionMasterResponse getAllInstitutionDetails() {
		return uiUtilityService.getAllInstitutionDetails();
	}

	@GetMapping(value = "/ui/getJobTypes/get", produces = "application/json")
	public JobTypeResponse getAllJobTypeDetails() {
		return uiUtilityService.getAllJobTypeDetails();
	}
	
	@GetMapping(value = "/ui/getAllUsers/get", produces = "application/json")
	public AllUserBasicProfileDetails getAllUsers() {
		return uiUtilityService.getAllUserBasicDetails();
	}
}