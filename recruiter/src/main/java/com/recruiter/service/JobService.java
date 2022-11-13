package com.recruiter.service;

import com.recruiter.domain.job.JobDetailsRequest;
import com.recruiter.domain.job.JobDetailsResponse;
import com.recruiter.domain.job.JobSearchResponse;
import com.recruiter.domain.recruiterdetails.RecruiterDetailsResponse;
import com.recruiter.domain.recruiterdetails.RecruiterJobDetailsResponse;

public interface JobService {
	public JobDetailsResponse addJobDetails(JobDetailsRequest jobDetailsRequest);

	public JobDetailsResponse editJobDetails(JobDetailsRequest jobDetailsRequest);

	public JobDetailsResponse deleteJobDetails(JobDetailsRequest jobDetailsRequest);

	public JobSearchResponse getAllJobs();
	
	public RecruiterDetailsResponse getRecruiterDetails(Integer companyId);
	
	public RecruiterJobDetailsResponse getAllJobsPostedByARecruiter(String loginId);
}
