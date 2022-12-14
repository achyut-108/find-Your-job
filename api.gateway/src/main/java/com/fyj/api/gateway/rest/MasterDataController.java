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
import com.fyj.api.gateway.domain.master.CompanyMasterAddRequest;
import com.fyj.api.gateway.domain.master.DegreeMasterAddRequest;
import com.fyj.api.gateway.domain.master.DegreeMasterResponse;
import com.fyj.api.gateway.domain.master.InstitutionMasterAddRequest;
import com.fyj.api.gateway.domain.master.InstitutionMasterResponse;
import com.fyj.api.gateway.domain.master.JobTypeResponse;
import com.fyj.api.gateway.service.MasterDataService;
import com.fyj.api.gateway.service.UiUtilityService;

@RestController
@CrossOrigin(origins = "http://localhost:80")
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
	
	@PostMapping(value = "/admin/addInstitution/post", produces = "application/json")
	public CommonServiceResponse addInstitution(@Valid @RequestBody InstitutionMasterAddRequest institutionMasterAddRequest) {
		log.info("request : {}", institutionMasterAddRequest.toString());
		return masterDataService.addInstitution(institutionMasterAddRequest);
	}
	
	@PostMapping(value = "/admin/editInstitution/post", produces = "application/json")
	public CommonServiceResponse editInstitution(@Valid @RequestBody InstitutionMasterAddRequest institutionMasterAddRequest) {
		log.info("request : {}", institutionMasterAddRequest.toString());
		return masterDataService.editInstitution(institutionMasterAddRequest);
	}
	
	@PostMapping(value = "/admin/addCompany/post", produces = "application/json")
	public CommonServiceResponse addCompany(@Valid @RequestBody CompanyMasterAddRequest companyMasterAddRequest) {
		log.info("request : {}", companyMasterAddRequest.toString());
		return masterDataService.addCompany(companyMasterAddRequest);
	}
	
	@PostMapping(value = "/admin/editCompany/post", produces = "application/json")
	public CommonServiceResponse editCompany(@Valid @RequestBody CompanyMasterAddRequest companyMasterAddRequest) {
		log.info("request : {}", companyMasterAddRequest.toString());
		return masterDataService.editCompany(companyMasterAddRequest);
	}
	
}