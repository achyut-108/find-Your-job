package com.fyj.domain.resume;

import java.io.Serializable;
import java.util.Date;

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
public class MainSkillsRequest extends CommonServiceRequest implements Serializable{
	public static final long serialVersionUID = 1L;
	
	@NotNull
	private String[] skills;
	@NotNull
	private String profileSummary;
	@NotNull
	private String address;
	@NotNull
	private String pinCode;
	@NotNull
	private String homeTown;
	@NotNull
	private Date dateOfBirth;
	@NotNull
	private String gender;
	@NotNull
	private String martialStatus;
}
