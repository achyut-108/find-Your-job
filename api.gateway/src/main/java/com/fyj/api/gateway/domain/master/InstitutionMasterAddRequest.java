package com.fyj.api.gateway.domain.master;

import java.io.Serializable;

import com.fyj.api.gateway.common.CommonServiceRequest;

import lombok.Data;

@Data
public class InstitutionMasterAddRequest extends CommonServiceRequest implements Serializable{

	private static final long serialVersionUID = 1L;
	private String InstitutionName;
	private String address;
	private String pinCode;
	private String location;
	public String getInstitutionName() {
		return InstitutionName;
	}
	public void setInstitutionName(String institutionName) {
		InstitutionName = institutionName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPinCode() {
		return pinCode;
	}
	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
}