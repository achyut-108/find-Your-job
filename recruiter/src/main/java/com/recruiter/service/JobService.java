package com.recruiter.service;

import com.recruiter.domain.job.JobDetailsRequest;
import com.recruiter.domain.job.JobDetailsResponse;
import com.recruiter.domain.job.JobSearchResponse;

public interface JobService {
	public JobDetailsResponse addJobDetails(JobDetailsRequest jobDetailsRequest);

	public JobDetailsResponse editJobDetails(JobDetailsRequest jobDetailsRequest);

	public JobDetailsResponse deleteJobDetails(JobDetailsRequest jobDetailsRequest);

	public JobSearchResponse getAllJobs();
}
