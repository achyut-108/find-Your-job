package com.fyj.api.gateway.service;

import com.fyj.api.gateway.common.CommonServiceResponse;
import com.fyj.api.gateway.domain.master.DegreeMasterAddRequest;
import com.fyj.api.gateway.domain.master.DegreeMasterResponse;
import com.fyj.api.gateway.domain.master.InstitutionMasterResponse;
import com.fyj.api.gateway.domain.master.JobTypeResponse;

public interface MasterDataService {
	
	public CommonServiceResponse addDegree(DegreeMasterAddRequest degreeMasterAddRequest);
}
