package com.fyj.api.gateway.domain.signup;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fyj.api.gateway.common.CommonServiceRequest;
import com.sun.istack.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper=false)
@AllArgsConstructor
@NoArgsConstructor
public class NewUserSignUpRequest extends CommonServiceRequest implements Serializable{
	public static final long serialVersionUID = 1L;
	
	@NotNull
	private String loginId;
	@NotNull
	private String firstName;
	@NotNull
	private String lastName;
	@NotNull
	private String password;
	@NotNull
	private String mobileNumber;
	@NotNull
	private String email;
	@NotNull
	private Integer userType;
	private String companyName;
	private String companyDescription;
}
