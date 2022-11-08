package com.fyj.domain.resume;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fyj.common.CommonServiceRequest;
import com.fyj.entity.UserProjectHistoryEntity;
import com.sun.istack.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@JsonAutoDetect
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
public class ProjectHistoryRequest extends CommonServiceRequest implements Serializable {
	public static final long serialVersionUID = 1L;

	@NotNull
	private Date startDate;
	@NotNull
	private Date endDate;
	@NotNull
	private String projectName;
	@NotNull
	private String projectDescription;
	
}
