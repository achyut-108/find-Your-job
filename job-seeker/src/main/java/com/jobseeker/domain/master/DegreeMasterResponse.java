package com.jobseeker.domain.master;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.jobseeker.common.CommonServiceResponse;
import com.jobseeker.entity.DegreeMasterEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class DegreeMasterResponse extends CommonServiceResponse implements Serializable {
	public static final long serialVersionUID = 1L;
	
	private List<DegreeMasterEntity> degreeDetails;
}