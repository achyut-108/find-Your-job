package com.fyj.api.gateway.service;

import com.fyj.api.gateway.common.CommonServiceResponse;
import com.fyj.api.gateway.domain.master.DegreeMasterAddRequest;

public interface MasterDataService {
	
	public CommonServiceResponse addDegree(DegreeMasterAddRequest degreeMasterAddRequest);
	
	public CommonServiceResponse editDegree(DegreeMasterAddRequest degreeMasterAddRequest);
}
