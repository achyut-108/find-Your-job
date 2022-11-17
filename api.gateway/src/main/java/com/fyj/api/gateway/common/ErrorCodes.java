package com.fyj.api.gateway.common;

/***
 * 
 * @author siddhartha.kumar
 *
 */
public enum ErrorCodes {

  INVALID_USER_ID("IHS_ERROR_600", "Your User Id is not Valid"),
  INVALID_PASSWORD("IHS_ERROR_601", "Your Password is not Valid"),
  INVALID_DATA("IHS_ERROR_602", "Invalid data type"),
  AUTHENTICATION_FAILED("IHS_ERROR_603","Not Authenticated"),
  INVALID_JOB_ID("IHS_ERROR_604", "Invalid job Id"),
  USER_ID_ALREADY_EXIST("FYJ_ERROR_605", "User id already in use"),
  EMAIL_ID_ALREADY_EXIST("FYJ_ERROR_606", "Email id already in use"),
  RECRUITER_DOES_NOT_EXIST("FYJ_ERROR_607","Recruiter does not exist"),
  JOB_DOES_NOT_EXIST("FYJ_ERROR_608","Job is invalid or it has no longer active"),
  ALREADY_APPLIED_TO_JOB("FYJ_ERROR_609","Already applied for this job");

  private final String code;
  private final String description;

  private ErrorCodes(String code, String description) {
    this.code = code;
    this.description = description;
  }

  public String getDescription() {
     return description;
  }

  public String getCode() {
     return code;
  }

  @Override
  public String toString() {
    return code + ": " + description;
  }

}