package com.recruiter.common;

import java.io.Serializable;

import lombok.Data;

@Data
public class CommonServiceRequest implements Serializable{

	public static final long serialVersionUID = 1L;
	private String loginId;
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	@Override
	public String toString() {
		return "CommonServiceRequest [loginId=" + loginId + "]";
	}
}

