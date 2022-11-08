package com.fyj.api.gateway.rest;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fyj.api.gateway.domain.login.LoginRequest;
import com.fyj.api.gateway.domain.login.LoginResponse;
import com.fyj.api.gateway.service.LoginService;

@RestController
@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping("/")
public class LoginController {

	private static final Logger log = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private LoginService loginService;

	@PostMapping(value = "/login/post", produces = "application/json")
	public LoginResponse login(@Valid @RequestBody LoginRequest loginRequest) {
		log.info("request : {}", loginRequest.toString());
		return loginService.login(loginRequest);
	}

	@PostMapping(value = "/logout/post", produces = "application/json")
	public LoginResponse logOut(@Valid @RequestBody LoginRequest loginRequest, HttpServletRequest httpServletRequest) {
		log.info("request : {}", loginRequest.toString());
		return loginService.logOut(loginRequest, httpServletRequest);
	}
}