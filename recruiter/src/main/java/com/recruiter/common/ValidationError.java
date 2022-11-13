package com.recruiter.common;

import lombok.Data;

@Data
public class ValidationError {

	private String errorCode;
	private String errorDescription;
	private String fieldName;
	private Object fieldValue;

	public ValidationError() {
	}

	public ValidationError(String errorCode, String errorDescription, String fieldName, Object fieldValue) {
		this.errorCode = errorCode;
		this.errorDescription = errorDescription;
		this.fieldName = fieldName;
		this.fieldValue = fieldValue;
	}

	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	public String getErrorDescription() {
		return errorDescription;
	}

	public void setErrorDescription(String errorDescription) {
		this.errorDescription = errorDescription;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public Object getFieldValue() {
		return fieldValue;
	}

	public void setFieldValue(Object fieldValue) {
		this.fieldValue = fieldValue;
	}
}
