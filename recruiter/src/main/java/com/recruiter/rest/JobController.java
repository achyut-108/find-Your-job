package com.recruiter.rest;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.recruiter.domain.job.JobDetailsRequest;
import com.recruiter.domain.job.JobDetailsResponse;
import com.recruiter.domain.job.JobSearchResponse;
import com.recruiter.domain.recruiterdetails.RecruiterDetailsResponse;
import com.recruiter.domain.recruiterdetails.RecruiterJobDetailsResponse;
import com.recruiter.service.JobService;

@RestController
@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping("/")
public class JobController {

	private static final Logger log = LoggerFactory.getLogger(JobController.class);

	@Autowired
	private JobService jobService;

	@PostMapping(value = "/job/postJob/post", produces = "application/json")
	public JobDetailsResponse addJobDetails(@Valid @RequestBody JobDetailsRequest jobDetailsRequest) {
		log.info("request : {}", jobDetailsRequest.toString());
		return jobService.addJobDetails(jobDetailsRequest);
	}

	@PostMapping(value = "/job/editJob/post", produces = "application/json")
	public JobDetailsResponse editJobDetails(@Valid @RequestBody JobDetailsRequest jobDetailsRequest) {
		log.info("request : {}", jobDetailsRequest.toString());
		return jobService.editJobDetails(jobDetailsRequest);
	}

	@PostMapping(value = "/job/deleteJob/post", produces = "application/json")
	public JobDetailsResponse deleteJobDetails(@Valid @RequestBody JobDetailsRequest jobDetailsRequest) {
		log.info("request : {}", jobDetailsRequest.toString());
		return jobService.deleteJobDetails(jobDetailsRequest);
	}

	@GetMapping(value = "/job/allJobs/get", produces = "application/json")
	public JobSearchResponse getAllJobs() {
		return jobService.getAllJobs();
	}
	
	@GetMapping(value = "/job/recruiterDetails/get/{companyId}", produces = "application/json")
	public RecruiterDetailsResponse getRecruiterDetails(@PathVariable("companyId") Integer companyId) {
		return jobService.getRecruiterDetails(companyId);
	}
	
	@GetMapping(value = "/job/recruiterJobDetails/get/{loginId}", produces = "application/json")
	public RecruiterJobDetailsResponse getAllJobsPostedByARecruiter(@PathVariable("loginId") String loginId) {
		return jobService.getAllJobsPostedByARecruiter(loginId);
	}
}