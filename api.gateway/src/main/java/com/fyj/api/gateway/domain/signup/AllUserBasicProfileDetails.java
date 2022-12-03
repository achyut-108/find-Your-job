package com.fyj.api.gateway.domain.signup;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fyj.api.gateway.common.CommonServiceResponse;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
public class AllUserBasicProfileDetails extends CommonServiceResponse implements Serializable {

	private static final long serialVersionUID = -4343533649718366458L;
	private List<UserBasicProfileDetails> allUserDetails;
	public List<UserBasicProfileDetails> getAllUserDetails() {
		return allUserDetails;
	}
	public void setAllUserDetails(List<UserBasicProfileDetails> allUserDetails) {
		this.allUserDetails = allUserDetails;
	}
}
