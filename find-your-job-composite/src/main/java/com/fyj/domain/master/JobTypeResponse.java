package com.fyj.domain.master;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fyj.common.CommonServiceResponse;
import com.fyj.entity.JobTypeMasterEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class JobTypeResponse extends CommonServiceResponse implements Serializable {
	public static final long serialVersionUID = 1L;
	
	private List<JobTypeMasterEntity> jobTypeDetails;
}