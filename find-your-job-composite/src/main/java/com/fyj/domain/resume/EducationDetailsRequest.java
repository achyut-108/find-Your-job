package com.fyj.domain.resume;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fyj.common.CommonServiceRequest;
import com.sun.istack.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
public class EducationDetailsRequest extends CommonServiceRequest implements Serializable {
	public static final long serialVersionUID = 1L;

	@NotNull
	private Integer degreeId;
	@NotNull
	private Integer institutionId;
	@NotNull
	private String major;
	@NotNull
	private Date startDate;
	@NotNull
	private Date endDate;
	@NotNull
	@Size(max=1,min=1)
	private String isHighest;

}
