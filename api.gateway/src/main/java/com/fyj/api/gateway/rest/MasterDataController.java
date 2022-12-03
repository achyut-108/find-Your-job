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

import com.fyj.api.gateway.common.CommonServiceResponse;
import com.fyj.api.gateway.domain.login.LoginRequest;
import com.fyj.api.gateway.domain.login.LoginResponse;
import com.fyj.api.gateway.domain.master.DegreeMasterAddRequest;
import com.fyj.api.gateway.domain.master.DegreeMasterResponse;
import com.fyj.api.gateway.domain.master.InstitutionMasterResponse;
import com.fyj.api.gateway.domain.master.JobTypeResponse;
import com.fyj.api.gateway.service.MasterDataService;
import com.fyj.api.gateway.service.UiUtilityService;

@RestController
@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping("/")
public class MasterDataController {

	private static final Logger log = LoggerFactory.getLogger(MasterDataController.class);

	@Autowired
	private UiUtilityService uiUtilityService;
	@Autowired
	private MasterDataService masterDataService;

	@GetMapping(value = "/admin/getAllDegree/get", produces = "application/json")
	public DegreeMasterResponse getAllDegreeDetails() {
		return uiUtilityService.getAllDegreeDetails();
	}
	
	@GetMapping(value = "/admin/getAllInstitution/get", produces = "application/json")
	public InstitutionMasterResponse getAllInstitutionDetails() {
		return uiUtilityService.getAllInstitutionDetails();
	}
	
	@GetMapping(value = "/admin/getJobTypes/get", produces = "application/json")
	public JobTypeResponse getAllJobTypeDetails() {
		return uiUtilityService.getAllJobTypeDetails();
	}
	
	@PostMapping(value = "/admin/addDegree/post", produces = "application/json")
	public CommonServiceResponse addDegree(@Valid @RequestBody DegreeMasterAddRequest degreeMasterAddRequest) {
		log.info("request : {}", degreeMasterAddRequest.toString());
		return masterDataService.addDegree(degreeMasterAddRequest);
	}
	
	@PostMapping(value = "/admin/editDegree/post", produces = "application/json")
	public CommonServiceResponse editDegree(@Valid @RequestBody DegreeMasterAddRequest degreeMasterAddRequest) {
		log.info("request : {}", degreeMasterAddRequest.toString());
		return masterDataService.editDegree(degreeMasterAddRequest);
	}
	
}