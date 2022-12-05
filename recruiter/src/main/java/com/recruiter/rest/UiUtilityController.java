package com.recruiter.rest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.recruiter.domain.master.DegreeMasterResponse;
import com.recruiter.domain.master.InstitutionMasterResponse;
import com.recruiter.domain.master.JobTypeResponse;
import com.recruiter.service.UiUtilityService;

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
}