package com.jobseeker.rest;

import java.math.BigInteger;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.jobseeker.common.CommonServiceRequest;
import com.jobseeker.common.CommonServiceResponse;
import com.jobseeker.domain.resume.EducationDetailsEditRequest;
import com.jobseeker.domain.resume.EducationDetailsRequest;
import com.jobseeker.domain.resume.EducationDetailsResponse;
import com.jobseeker.domain.resume.EmploymentHistoryEditRequest;
import com.jobseeker.domain.resume.EmploymentHistoryRequest;
import com.jobseeker.domain.resume.EmploymentHistoryResponse;
import com.jobseeker.domain.resume.MainSkillsEditRequest;
import com.jobseeker.domain.resume.MainSkillsRequest;
import com.jobseeker.domain.resume.MainSkillsResponse;
import com.jobseeker.domain.resume.ProjectHistoryEditRequest;
import com.jobseeker.domain.resume.ResumeResponse;
import com.jobseeker.entity.ResumeEntity;
import com.jobseeker.service.ResumeService;

@RestController
@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping("/")
public class ResumeController {

	private static final Logger log = LoggerFactory.getLogger(ResumeController.class);

	@Autowired
	private ResumeService resumeService;

	@PostMapping(value = "/resume/addSkillsAndGeneralDetails/post", produces = "application/json")
	public CommonServiceResponse addSkillsAndGeneralDetails(@Valid @RequestBody MainSkillsRequest mainSkillsRequest) {
		log.info("request : {}", mainSkillsRequest.toString());
		return resumeService.addSkillsAndGeneralDetails(mainSkillsRequest);
	}
	
	@PostMapping(value = "/resume/addUserEducationDetails/post", produces = "application/json")
	public CommonServiceResponse addUserEducationDetails(@Valid @RequestBody EducationDetailsRequest educationDetailsRequest) {
		log.info("request : {}", educationDetailsRequest.toString());
		return resumeService.addUserEducationDetails(educationDetailsRequest);
	}
	
	/**
	 * Responsible for adding the employment history along with project details
	 * @param employmentHistoryRequest
	 * @return
	 */
	@PostMapping(value = "/resume/addUserEmploymentHistory/post", produces = "application/json")
	public CommonServiceResponse addUserEmploymentHistory(@Valid @RequestBody EmploymentHistoryRequest employmentHistoryRequest) {
		log.info("request : {}", employmentHistoryRequest.toString());
		return resumeService.addUserEmploymentHistory(employmentHistoryRequest);
	}
	
	@PostMapping(value = "/resume/profileDetails/employementHistory/get", produces = "application/json")
	public EmploymentHistoryResponse getUserEmploymentHistory(@Valid @RequestBody CommonServiceRequest  commonServiceRequest) {
		log.info("request : {}", commonServiceRequest.toString());
		return resumeService.getUserEmploymentHistory(commonServiceRequest);
	}
	
	@PostMapping(value = "/resume/profileDetails/educationDetails/get", produces = "application/json")
	public EducationDetailsResponse getUserEductaionDetails(@Valid @RequestBody CommonServiceRequest  commonServiceRequest) {
		log.info("request : {}", commonServiceRequest.toString());
		return resumeService.getUserEductaionDetails(commonServiceRequest);
	}
	
	@PostMapping(value = "/resume/profileDetails/skills/get", produces = "application/json")
	public MainSkillsResponse getMainSkills(@Valid @RequestBody CommonServiceRequest  commonServiceRequest) {
		log.info("request : {}", commonServiceRequest.toString());
		return resumeService.getMainSkills(commonServiceRequest);
	}
	
	@PostMapping(value = "/resume/editSkillsAndGeneralDetails/post", produces = "application/json")
	public CommonServiceResponse editSkillsAndGeneralDetails(@Valid @RequestBody MainSkillsEditRequest mainSkillsEditRequest) {
		log.info("request : {}", mainSkillsEditRequest.toString());
		return resumeService.editSkillsAndGeneralDetails(mainSkillsEditRequest);
	}
	
	@PostMapping(value = "/resume/editUserEducationDetails/post", produces = "application/json")
	public CommonServiceResponse editUserEducationDetails(@Valid @RequestBody EducationDetailsEditRequest educationDetailsEditRequest) {
		log.info("request : {}", educationDetailsEditRequest.toString());
		return resumeService.editUserEducationDetails(educationDetailsEditRequest);
	}
	
	/**
	 * Responsible for adding the employment history along with project details
	 * @param employmentHistoryRequest
	 * @return
	 */
	@PostMapping(value = "/resume/editUserEmploymentHistory/post", produces = "application/json")
	public CommonServiceResponse editUserEmploymentHistory(@Valid @RequestBody EmploymentHistoryEditRequest employmentHistoryEditRequest) {
		log.info("request : {}", employmentHistoryEditRequest.toString());
		return resumeService.editUserEmploymentHistory(employmentHistoryEditRequest);
	}
	
	@PostMapping(value = "/resume/editUserProjectHistory/post", produces = "application/json")
	public CommonServiceResponse editProjectHisory(@Valid @RequestBody ProjectHistoryEditRequest projectHistoryEditRequest) {
		log.info("request : {}", projectHistoryEditRequest.toString());
		return resumeService.editProjectHisory(projectHistoryEditRequest);
	}
	
	@PostMapping(value = "/resume/getProjectHisoryForAEmployment/get", produces = "application/json")
	public CommonServiceResponse getProjectHisoryForAEmployment(@Valid @RequestBody ProjectHistoryEditRequest projectHistoryEditRequest) {
		log.info("request : {}", projectHistoryEditRequest.toString());
		return resumeService.getProjectHisoryForAEmployment(projectHistoryEditRequest);
	}
	
	@PostMapping("/resume/uploadResume/{loginId}")
    public CommonServiceResponse uploadResume(@RequestParam("resume") MultipartFile resume, @PathVariable("loginId") String loginId) {
		return resumeService.uploadResume(resume, loginId);
	}
	
	@GetMapping("/resume/downloadResume/{userId}")
    public ResponseEntity<Resource> downloadFile(@PathVariable BigInteger userId) {
        ResumeResponse resumeResponse = resumeService.downloadResume(userId);
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(resumeResponse.getResumeFileType()))
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resumeResponse.getResumeName() + "\"")
                .body(new ByteArrayResource(resumeResponse.getResumeContent()));
    }
}