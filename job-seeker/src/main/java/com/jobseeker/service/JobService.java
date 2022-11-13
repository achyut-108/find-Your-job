package com.jobseeker.service;

import com.jobseeker.domain.jobapply.JobApplyRequest;
import com.jobseeker.domain.jobapply.JobDetailsResponse;
import com.jobseeker.domain.jobapply.JobSearchResponse;

public interface JobService {
	public JobDetailsResponse addJobDetails(JobApplyRequest jobDetailsRequest);

	public JobDetailsResponse editJobDetails(JobApplyRequest jobDetailsRequest);

	public JobDetailsResponse deleteJobDetails(JobApplyRequest jobDetailsRequest);

	public JobSearchResponse getAllJobs();
}
