package com.jobseeker.starter;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableEurekaClient
@ComponentScan("com.jobseeker")
@EnableJpaRepositories(basePackages = {"com.jobseeker.repo"})
@EnableTransactionManagement
@EntityScan(basePackages = {"com.jobseeker.entity"})
public class JobSeekerAppStarter {

	
	//private static ApplicationContext applicationContext;
	public static void main(String[] args) {
		SpringApplication.run(JobSeekerAppStarter.class, args);

//		applicationContext = new AnnotationConfigApplicationContext(GetSetGoCoreApplication.class);
//
//		for (String beanName : applicationContext.getBeanDefinitionNames()) {
//			System.out.println(beanName);
//		}	
	}
}