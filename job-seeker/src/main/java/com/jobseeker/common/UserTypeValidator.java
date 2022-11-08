package com.jobseeker.common;

import java.util.HashMap;
import java.util.Map;

public class UserTypeValidator implements Cloneable {

	public static final UserTypeValidator INSTANCE = new UserTypeValidator();
	private static final Map<Integer, String> userTypeMap =  new HashMap<Integer, String>();
	
	static {
		userTypeMap.put(1, "JOB_SEEKER");
		userTypeMap.put(2, "JOB_POSTER");
	}
	
	private UserTypeValidator() {
	}

	public String getUserType(Integer userType) {
		return userTypeMap.get(userType);
	}
	
	public boolean validate(Integer userType) {
		return userTypeMap.get(userType)!=null;
	}
	
	@Override
	public UserTypeValidator clone() throws CloneNotSupportedException{
		return INSTANCE;
	}

	/**
     * To Prevent creation of other instance by serialization
     * @return
     */
	public Object readResolve() {
		return INSTANCE;
	}
}