package com.jobseeker.service;

import com.jobseeker.common.CommonServiceRequest;
import com.jobseeker.domain.jobapply.JobApplyRequest;
import com.jobseeker.domain.jobapply.JobApplyResponse;
import com.jobseeker.domain.jobapply.JobsAppliedResponse;
import com.jobseeker.domain.jobapply.JobsAppliedStatisticsResponse;
import com.jobseeker.domain.resume.JobApplicationStatusRequest;
import com.jobseeker.domain.resume.JobApplicationStatusResponse;

public interface JobApplyService {
	
	public JobApplyResponse applyToAJob(JobApplyRequest jobApplyRequest);
	public JobsAppliedResponse jobsApplied(String loginId);
	public JobApplicationStatusResponse getJobApplicationStatus(JobApplicationStatusRequest jobApplicationStatusRequest);
	public JobsAppliedStatisticsResponse getJobAppliedStatistics(CommonServiceRequest commonServiceRequest);
}
