package com.jobseeker.domain.resume;

import java.io.Serializable;
import java.math.BigInteger;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.jobseeker.common.CommonServiceResponse;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class ResumeResponse extends CommonServiceResponse implements Serializable {
	public static final long serialVersionUID = 1L;
	
	private String resumeName;
	private byte[] resumeContent;
	private String resumeFileType;
	private BigInteger userId;
	public String getResumeName() {
		return resumeName;
	}
	public void setResumeName(String resumeName) {
		this.resumeName = resumeName;
	}
	public byte[] getResumeContent() {
		return resumeContent;
	}
	public void setResumeContent(byte[] resumeContent) {
		this.resumeContent = resumeContent;
	}
	public String getResumeFileType() {
		return resumeFileType;
	}
	public void setResumeFileType(String resumeFileType) {
		this.resumeFileType = resumeFileType;
	}
	public BigInteger getUserId() {
		return userId;
	}
	public void setUserId(BigInteger userId) {
		this.userId = userId;
	}
}