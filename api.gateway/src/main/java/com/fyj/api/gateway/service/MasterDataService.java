package com.fyj.api.gateway.service;

import com.fyj.api.gateway.common.CommonServiceResponse;
import com.fyj.api.gateway.domain.master.CompanyMasterAddRequest;
import com.fyj.api.gateway.domain.master.DegreeMasterAddRequest;
import com.fyj.api.gateway.domain.master.InstitutionMasterAddRequest;

public interface MasterDataService {
	
	public CommonServiceResponse addDegree(DegreeMasterAddRequest degreeMasterAddRequest);
	
	public CommonServiceResponse editDegree(DegreeMasterAddRequest degreeMasterAddRequest);

	public CommonServiceResponse addInstitution(InstitutionMasterAddRequest institutionMasterAddRequest);

	public CommonServiceResponse editInstitution(InstitutionMasterAddRequest institutionMasterAddRequest);

	public CommonServiceResponse addCompany(CompanyMasterAddRequest companyMasterAddRequest);

	public CommonServiceResponse editCompany(CompanyMasterAddRequest companyMasterAddRequest);
}
