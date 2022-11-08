package com.fyj.service;

import com.fyj.domain.job.JobDetailsRequest;
import com.fyj.domain.job.JobDetailsResponse;
import com.fyj.domain.job.JobSearchResponse;

public interface JobService {
	public JobDetailsResponse addJobDetails(JobDetailsRequest jobDetailsRequest);

	public JobDetailsResponse editJobDetails(JobDetailsRequest jobDetailsRequest);

	public JobDetailsResponse deleteJobDetails(JobDetailsRequest jobDetailsRequest);

	public JobSearchResponse getAllJobs();
}
