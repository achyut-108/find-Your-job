package com.recruiter.common;

import java.util.HashMap;
import java.util.Map;

public interface BusinessConstants {

	public static final String ACTIVE = "Y";
	public static final String INACTIVE = "N";
	public static final Integer FULL_TIME = 1;
	public static final Integer CONTRACTUAL = 2;
	public static final Integer INTERNSHIP = 3;
	static Map<Integer, String> jobTypeMap = new HashMap<>();
	public static final Boolean TRUE = true;
	public static final Boolean FALSE = false;
	public static final String SUCCESS = "success";
	public static final String ACCEPTED = "Y";
	public static final String REJECTED = "N";

	static Map<Integer, String> getJobTypeMap() {
		
		if(jobTypeMap.isEmpty()) {
			jobTypeMap.put(FULL_TIME, "FULL_TIME");
			jobTypeMap.put(CONTRACTUAL, "CONTRACTUAL");
			jobTypeMap.put(INTERNSHIP, "INTERNSHIP");
		}
		
		return jobTypeMap;
		
	}

}
