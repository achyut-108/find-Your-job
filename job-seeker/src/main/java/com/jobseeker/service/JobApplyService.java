package com.jobseeker.service;

import com.jobseeker.domain.jobapply.JobApplyRequest;
import com.jobseeker.domain.jobapply.JobApplyResponse;
import com.jobseeker.domain.jobapply.JobsAppliedResponse;

public interface JobApplyService {
	
	public JobApplyResponse applyToAJob(JobApplyRequest jobApplyRequest);
	public JobsAppliedResponse jobsApplied(String loginId);
}
