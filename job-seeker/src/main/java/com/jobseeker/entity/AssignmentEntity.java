package com.jobseeker.entity;

import java.math.BigInteger;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author saurabh.shyam
 * @since Feb 25, 2021 5:43 PM
 */
@Entity
@Table(name = "assignment_trans")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AssignmentEntity {
    
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private BigInteger id;
	@Column(name="assignment_name")
    private String assignmentName;
	@Column(name="assignment_type")
    private String assignmentType;
	@Column(name="file_type")
    private String fileType;
	@Column(name="trainer_id")
    private Long trainerId;
	@Column(name="trainee_id")
    private Long traineeId;
    @Lob
    @Column(name="data")
    private byte[] data;
	public BigInteger getId() {
		return id;
	}
	public void setId(BigInteger id) {
		this.id = id;
	}
	public String getAssignmentName() {
		return assignmentName;
	}
	public void setAssignmentName(String assignmentName) {
		this.assignmentName = assignmentName;
	}
	public String getAssignmentType() {
		return assignmentType;
	}
	public void setAssignmentType(String assignmentType) {
		this.assignmentType = assignmentType;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public Long getTrainerId() {
		return trainerId;
	}
	public void setTrainerId(Long trainerId) {
		this.trainerId = trainerId;
	}
	public Long getTraineeId() {
		return traineeId;
	}
	public void setTraineeId(Long traineeId) {
		this.traineeId = traineeId;
	}
	public byte[] getData() {
		return data;
	}
	public void setData(byte[] data) {
		this.data = data;
	}
}