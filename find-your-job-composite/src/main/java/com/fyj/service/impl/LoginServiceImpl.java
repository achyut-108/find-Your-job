package com.fyj.service.impl;

import java.util.Enumeration;
import java.util.Objects;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fyj.common.BusinessConstants;
import com.fyj.common.ValidationError;
import com.fyj.domain.login.LoginRequest;
import com.fyj.domain.login.LoginResponse;
import com.fyj.entity.UserEntity;
import com.fyj.repo.UserRepository;
import com.fyj.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private UserRepository userRepository;

	/**
	 * To do : make a interface with validate method and every service class should
	 * implement this
	 * 
	 * The validate would be generic such that as per the service class the
	 * appropriate object is returned (making use of reflection)
	 */
	@Override
	public LoginResponse login(LoginRequest loginRequest) {

		LoginResponse loginResponse = new LoginResponse();

		UserEntity user = userRepository.findByLoginIdAndPasswordAndActive(loginRequest.getLoginId(),
				loginRequest.getPassword(),BusinessConstants.ACTIVE);

		if (Objects.isNull(user)) {
			loginResponse.addValidationError(
					new ValidationError("", "Invalid Credentials", "loginId", loginRequest.getLoginId()));
		}

		if (loginResponse.getValidationErrors().isEmpty()) {
			loginResponse.setSuccess(true);
			loginResponse.setMessage("successfully logged in");
			return loginResponse;
		}

		return loginResponse;

	}

	@Override
	public LoginResponse logOut(LoginRequest loginRequest, HttpServletRequest request) {
		// SecurityContextHolder.getContext().setAuthentication(null);
		// SecurityContextHolder.clearContext();
		HttpSession hs = request.getSession();
		Enumeration e = hs.getAttributeNames();
		while (e.hasMoreElements()) {
			String attr = (String) e.nextElement();
			hs.setAttribute(attr, null);
		}
		removeCookies(request);
		hs.invalidate();

		LoginResponse loginResponse = new LoginResponse();
		loginResponse.setMessage("Successfully Logged out");
		loginResponse.setSuccess(true);
		return loginResponse;
	}

	public static void removeCookies(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				cookies[i].setMaxAge(0);
			}
		}
	}
}
