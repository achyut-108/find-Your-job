package com.fyj.domain.resume;

import java.io.Serializable;
import java.math.BigInteger;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fyj.common.CommonServiceResponse;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class EmploymentHistoryResponse extends CommonServiceResponse implements Serializable {
	public static final long serialVersionUID = 1L;
}