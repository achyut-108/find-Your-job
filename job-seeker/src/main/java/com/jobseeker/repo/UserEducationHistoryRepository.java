package com.jobseeker.repo;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jobseeker.entity.UserEducationHistoryEntity;

@Repository
public interface UserEducationHistoryRepository extends CrudRepository<UserEducationHistoryEntity, BigInteger>{
	
	@Query(value = "select major,start_date,end_Date,is_highest,degree,\r\n"
			+ "degree_description,institution_name,address,pin_code,\r\n"
			+ "location from user_education_history ueh, m_degree dm, m_institution im\r\n"
			+ "where ueh.degree_id = dm.degree_id and ueh.user_id = ?1 \r\n"
			+ "and ueh.institution_id = im.institution_id;", nativeQuery = true)
	List<Object[]> getUserEducationDetails(BigInteger userId);
}
