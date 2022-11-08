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
public class UserBasicProfileDetails extends CommonServiceResponse implements Serializable {

	private static final long serialVersionUID = -4343533649718366458L;
	private BigInteger userId;
	private String firstName;
	private String lastName;
	private String email;
	private String userType;
	private String mobileNumber;
	private String loginId;

}
