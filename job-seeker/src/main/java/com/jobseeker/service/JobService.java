package com.jobseeker.service;

import com.jobseeker.domain.job.JobDetailsRequest;
import com.jobseeker.domain.job.JobDetailsResponse;
import com.jobseeker.domain.job.JobSearchResponse;

public interface JobService {
	public JobDetailsResponse addJobDetails(JobDetailsRequest jobDetailsRequest);

	public JobDetailsResponse editJobDetails(JobDetailsRequest jobDetailsRequest);

	public JobDetailsResponse deleteJobDetails(JobDetailsRequest jobDetailsRequest);

	public JobSearchResponse getAllJobs();
}
