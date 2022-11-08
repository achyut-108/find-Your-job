package com.recruiter.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DataSourceConfig {

	/***
	 * This will be overrided if properties found in application.yml
	 */
	@Autowired
	private DataSourcePropertiesConfig dataSourcePropertiesConfig;

	@Bean
	public DataSource getDataSource() {
		return DataSourceBuilder.create().
				driverClassName("com.mysql.jdbc.Driver")
				.url("jdbc:mysql://localhost:3306/job_search").
				username("root").password("root@root").build();
	}
}
