package com.jobseeker.entity;

import java.math.BigInteger;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "user", schema = "job_search")
public class UserEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id")
	private BigInteger userId;
	@Column(name = "first_name")
	private String firstName;
	@Column(name = "last_name")
	private String lastName;
	@Column(name = "email")
	private String email;
	@Column(name = "user_type_id")
	private Integer userTypeId;
	@Column(name = "password")
	private String password;
	@Column(name = "login_attempt")
	private Integer loginAttempt;
	@Column(name = "mobile_number")
	private String mobileNumber;
	@Column(name = "login_id")
	private String loginId;
	@Column(name = "active")
	private String active;

}