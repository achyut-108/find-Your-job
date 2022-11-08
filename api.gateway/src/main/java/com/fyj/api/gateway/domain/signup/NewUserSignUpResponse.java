package com.fyj.api.gateway.domain.signup;

import java.io.Serializable;
import java.math.BigInteger;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fyj.api.gateway.common.CommonServiceResponse;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class NewUserSignUpResponse extends CommonServiceResponse implements Serializable {
	public static final long serialVersionUID = 1L;
	
	private String userId;
	private String userType;
}