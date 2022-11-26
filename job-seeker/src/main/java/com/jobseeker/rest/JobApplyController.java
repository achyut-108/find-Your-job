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

import com.jobseeker.domain.jobapply.JobApplyRequest;
import com.jobseeker.domain.jobapply.JobApplyResponse;
import com.jobseeker.domain.jobapply.JobsAppliedResponse;
import com.jobseeker.domain.resume.JobApplicationStatusRequest;
import com.jobseeker.domain.resume.JobApplicationStatusResponse;
import com.jobseeker.service.JobApplyService;

@RestController
@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping("/")
public class JobApplyController {

	private static final Logger log = LoggerFactory.getLogger(JobApplyController.class);

	@Autowired
	private JobApplyService jobApplyService;
	
	@PostMapping(value = "/job/applyjob/post/", produces = "application/json")
	public JobApplyResponse addJobDetails(@Valid @RequestBody JobApplyRequest jobApplyRequest) {
		log.info("request : {}", jobApplyRequest);
		return jobApplyService.applyToAJob(jobApplyRequest);
	}
	
	@PostMapping(value = "/job/appliedJobs/get/{loginId}", produces = "application/json")
	public JobsAppliedResponse jobsApplied(@PathVariable("loginId") String loginId) {
		log.info("request : {}", loginId);
		return jobApplyService.jobsApplied(loginId);
	}
	
	@PostMapping(value = "/job/jobApplicationsStatus/get/", produces = "application/json")
	public JobApplicationStatusResponse getjobApplicationStatus(@Valid @RequestBody JobApplicationStatusRequest jobApplicationStatusRequest) {
		log.info("request : {}", jobApplicationStatusRequest);
		return jobApplyService.getJobApplicationStatus(jobApplicationStatusRequest);
	}
}