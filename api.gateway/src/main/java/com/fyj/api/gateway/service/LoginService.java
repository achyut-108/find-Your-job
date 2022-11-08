package com.fyj.api.gateway.service;

import javax.servlet.http.HttpServletRequest;

import com.fyj.api.gateway.domain.login.LoginRequest;
import com.fyj.api.gateway.domain.login.LoginResponse;

public interface LoginService {

	public LoginResponse login(LoginRequest loginRequest);
	public LoginResponse logOut(LoginRequest loginRequest,HttpServletRequest httpServletRequest);
}
