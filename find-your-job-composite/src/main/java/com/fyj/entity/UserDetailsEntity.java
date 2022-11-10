package com.fyj.entity;

import java.math.BigInteger;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "user_details", schema = "job_search")
public class UserDetailsEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id")
	private BigInteger userId;
	@Column(name = "user_role_id")
	private String userRoleId;
	@Column(name = "skills")
	private String skills;
	@Column(name = "profile_summary")
	private String profileSummary;
	@Column(name = "address")
	private String address;
	@Column(name = "pin_code")
	private String pinCode;
	@Column(name = "home_town")
	private String homeTown;
	@Column(name = "date_of_birth")
	private Date dateOfBirth;
	@Column(name = "gender")
	private String gender;
	@Column(name = "martial_status")
	private String martialStatus;

}