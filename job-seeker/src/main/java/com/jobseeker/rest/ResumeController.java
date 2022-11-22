package com.jobseeker.rest;

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

import com.jobseeker.common.CommonServiceRequest;
import com.jobseeker.common.CommonServiceResponse;
import com.jobseeker.domain.resume.EducationDetailsRequest;
import com.jobseeker.domain.resume.EducationDetailsResponse;
import com.jobseeker.domain.resume.EmploymentHistoryRequest;
import com.jobseeker.domain.resume.EmploymentHistoryResponse;
import com.jobseeker.domain.resume.MainSkillsRequest;
import com.jobseeker.domain.resume.MainSkillsResponse;
import com.jobseeker.service.ResumeService;

@RestController
@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping("/")
public class ResumeController {

	private static final Logger log = LoggerFactory.getLogger(ResumeController.class);

	@Autowired
	private ResumeService resumeService;

	@PostMapping(value = "/resume/addSkillsAndGeneralDetails/post", produces = "application/json")
	public CommonServiceResponse addSkillsAndGeneralDetails(@Valid @RequestBody MainSkillsRequest mainSkillsRequest) {
		log.info("request : {}", mainSkillsRequest.toString());
		return resumeService.addSkillsAndGeneralDetails(mainSkillsRequest);
	}
	
	@PostMapping(value = "/resume/addUserEducationDetails/post", produces = "application/json")
	public CommonServiceResponse addUserEducationDetails(@Valid @RequestBody EducationDetailsRequest educationDetailsRequest) {
		log.info("request : {}", educationDetailsRequest.toString());
		return resumeService.addUserEducationDetails(educationDetailsRequest);
	}
	
	/**
	 * Responsible for adding the employment history along with project details
	 * @param employmentHistoryRequest
	 * @return
	 */
	@PostMapping(value = "/resume/addUserEmploymentHistory/post", produces = "application/json")
	public CommonServiceResponse addUserEmploymentHistory(@Valid @RequestBody EmploymentHistoryRequest employmentHistoryRequest) {
		log.info("request : {}", employmentHistoryRequest.toString());
		return resumeService.addUserEmploymentHistory(employmentHistoryRequest);
	}
	
	@PostMapping(value = "/resume/profileDetails/employementHistory/get", produces = "application/json")
	public EmploymentHistoryResponse getUserEmploymentHistory(@Valid @RequestBody CommonServiceRequest  commonServiceRequest) {
		log.info("request : {}", commonServiceRequest.toString());
		return resumeService.getUserEmploymentHistory(commonServiceRequest);
	}
	
	@PostMapping(value = "/resume/profileDetails/educationDetails/get", produces = "application/json")
	public EducationDetailsResponse getUserEductaionDetails(@Valid @RequestBody CommonServiceRequest  commonServiceRequest) {
		log.info("request : {}", commonServiceRequest.toString());
		return resumeService.getUserEductaionDetails(commonServiceRequest);
	}
	
	@PostMapping(value = "/resume/profileDetails/skills/get", produces = "application/json")
	public MainSkillsResponse getMainSkills(@Valid @RequestBody CommonServiceRequest  commonServiceRequest) {
		log.info("request : {}", commonServiceRequest.toString());
		return resumeService.getMainSkills(commonServiceRequest);
	}
}