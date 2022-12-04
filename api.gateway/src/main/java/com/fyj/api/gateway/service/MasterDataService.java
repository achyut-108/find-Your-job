package com.fyj.api.gateway.service;

import javax.validation.Valid;

import com.fyj.api.gateway.common.CommonServiceResponse;
import com.fyj.api.gateway.domain.master.DegreeMasterAddRequest;
import com.fyj.api.gateway.domain.master.InstitutionMasterAddRequest;

public interface MasterDataService {
	
	public CommonServiceResponse addDegree(DegreeMasterAddRequest degreeMasterAddRequest);
	
	public CommonServiceResponse editDegree(DegreeMasterAddRequest degreeMasterAddRequest);

	public CommonServiceResponse addInstitution(@Valid InstitutionMasterAddRequest institutionMasterAddRequest);

	public CommonServiceResponse editInstitution(@Valid InstitutionMasterAddRequest institutionMasterAddRequest);
}
