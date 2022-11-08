package com.fyj.domain.login;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fyj.common.CommonServiceRequest;
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
public class LoginRequest extends CommonServiceRequest implements Serializable{
	public static final long serialVersionUID = 1L;
	
	@NotNull
	private String loginId;
	@NotNull
	private String password;
}
