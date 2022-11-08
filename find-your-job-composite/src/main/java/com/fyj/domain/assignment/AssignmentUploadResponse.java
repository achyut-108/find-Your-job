package com.fyj.domain.assignment;

import java.io.Serializable;
import java.math.BigInteger;

import com.fyj.common.CommonServiceResponse;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class AssignmentUploadResponse extends CommonServiceResponse implements Serializable{

	public static final long serialVersionUID = 1L;
	
	private BigInteger assignmentId;
}
