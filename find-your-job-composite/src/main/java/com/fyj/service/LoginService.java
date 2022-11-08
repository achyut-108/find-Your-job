package com.fyj.service;

import javax.servlet.http.HttpServletRequest;

import com.fyj.domain.login.LoginRequest;
import com.fyj.domain.login.LoginResponse;

public interface LoginService {

	public LoginResponse login(LoginRequest loginRequest);
	public LoginResponse logOut(LoginRequest loginRequest,HttpServletRequest httpServletRequest);
}
