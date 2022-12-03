package com.recruiter.service;

import java.math.BigInteger;

import com.recruiter.common.CommonServiceResponse;
import com.recruiter.domain.job.JobDetailsDeleteRequest;
import com.recruiter.domain.job.JobDetailsRequest;
import com.recruiter.domain.job.JobDetailsResponse;
import com.recruiter.domain.job.JobSearchResponse;
import com.recruiter.domain.job.JobSeekerDetailsResponse;
import com.recruiter.domain.job.RecruiterActionsOnJobApplicationRequest;
import com.recruiter.domain.recruiterdetails.RecruiterDetailsEditRequest;
import com.recruiter.domain.recruiterdetails.RecruiterDetailsResponse;
import com.recruiter.domain.recruiterdetails.RecruiterJobDetailsResponse;

public interface JobService {
	public JobDetailsResponse addJobDetails(JobDetailsRequest jobDetailsRequest);

	public JobDetailsResponse editJobDetails(JobDetailsRequest jobDetailsRequest);

	public JobDetailsResponse deleteJobDetails(JobDetailsDeleteRequest jobId);

	public JobSearchResponse getAllJobs();
	
	public RecruiterDetailsResponse getRecruiterBasicDetailsByLoginId(String loginId);
	
	public RecruiterJobDetailsResponse getAllJobsPostedByARecruiter(String loginId);
	
	public JobSeekerDetailsResponse getAllJobSeekersAppliedForAJob(BigInteger jobId);
	
	public CommonServiceResponse acceptOrRejectCandidateJobApplication(RecruiterActionsOnJobApplicationRequest recruiterActionsOnJobApplicationRequest);
	
	public RecruiterDetailsResponse getRecruiterBasicDetailsByCompanyId(Integer companyId);
	
	public CommonServiceResponse editRecruiterBasicDetails(RecruiterDetailsEditRequest recruiterDetailsEditRequest);
	
}
