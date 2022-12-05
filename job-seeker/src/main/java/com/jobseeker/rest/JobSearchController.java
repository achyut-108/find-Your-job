package com.jobseeker.rest;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jobseeker.common.CommonServiceResponse;
import com.jobseeker.domain.jobapply.JobApplyRequest;
import com.jobseeker.domain.jobapply.JobApplyResponse;
import com.jobseeker.domain.jobapply.JobsAppliedResponse;
import com.jobseeker.service.JobApplyService;

@RestController
@CrossOrigin(origins = "http://localhost:80")
@RequestMapping("/")
public class JobSearchController {

	private static final Logger log = LoggerFactory.getLogger(JobSearchController.class);

	@Autowired
	private JobApplyService jobApplyService;
	
	@PostMapping(value = "/job/search/jobDescription/", produces = "application/json")
	public JobApplyResponse addJobDetails(@Valid @RequestBody JobApplyRequest jobApplyRequest) {
		log.info("request : {}", jobApplyRequest);
		
		return (JobApplyResponse) new CommonServiceResponse();
		//return jobApplyService.applyToAJob(jobApplyRequest);
	}
	
	@PostMapping(value = "/job/search/skill}", produces = "application/json")
	public JobsAppliedResponse jobsApplied(@PathVariable("loginId") String loginId) {
		return (JobsAppliedResponse) new CommonServiceResponse();
	}
}