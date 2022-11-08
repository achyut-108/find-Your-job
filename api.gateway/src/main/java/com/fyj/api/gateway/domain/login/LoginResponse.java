package com.fyj.api.gateway.domain.login;

import java.io.Serializable;
import java.math.BigInteger;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fyj.api.gateway.common.CommonServiceResponse;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class LoginResponse extends CommonServiceResponse implements Serializable {
	public static final long serialVersionUID = 1L;
}