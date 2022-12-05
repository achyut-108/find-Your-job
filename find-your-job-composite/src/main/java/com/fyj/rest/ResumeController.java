package com.fyj.rest;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fyj.domain.resume.EducationDetailsRequest;
import com.fyj.domain.resume.EducationDetailsResponse;
import com.fyj.domain.resume.EmploymentHistoryRequest;
import com.fyj.domain.resume.EmploymentHistoryResponse;
import com.fyj.domain.resume.MainSkillsRequest;
import com.fyj.domain.resume.MainSkillsResponse;
import com.fyj.service.ResumeService;

@RestController
@CrossOrigin(origins = "http://localhost:80")
@RequestMapping("/")
public class ResumeController {

	private static final Logger log = LoggerFactory.getLogger(ResumeController.class);

	@Autowired
	private ResumeService resumeService;

	@PostMapping(value = "/resume/addSkillsAndGeneralDetails/post", produces = "application/json")
	public MainSkillsResponse addSkillsAndGeneralDetails(@Valid @RequestBody MainSkillsRequest mainSkillsRequest) {
		log.info("request : {}", mainSkillsRequest.toString());
		return resumeService.addSkillsAndGeneralDetails(mainSkillsRequest);
	}
	
	@PostMapping(value = "/resume/addUserEducationDetails/post", produces = "application/json")
	public EducationDetailsResponse addUserEducationDetails(@Valid @RequestBody EducationDetailsRequest educationDetailsRequest) {
		log.info("request : {}", educationDetailsRequest.toString());
		return resumeService.addUserEducationDetails(educationDetailsRequest);
	}
	
	/**
	 * Responsible for adding the employment history along with project details
	 * @param employmentHistoryRequest
	 * @return
	 */
	@PostMapping(value = "/resume/addUserEmploymentHistory/post", produces = "application/json")
	public EmploymentHistoryResponse addUserEmploymentHistory(@Valid @RequestBody EmploymentHistoryRequest employmentHistoryRequest) {
		log.info("request : {}", employmentHistoryRequest.toString());
		return resumeService.addUserEmploymentHistory(employmentHistoryRequest);
	}
}