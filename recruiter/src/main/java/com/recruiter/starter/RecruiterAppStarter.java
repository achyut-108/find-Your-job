package com.recruiter.starter;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableEurekaClient
@ComponentScan("com.recruiter")
@EnableJpaRepositories(basePackages = {"com.recruiter.repo"})
@EnableTransactionManagement
@EntityScan(basePackages = {"com.recruiter.entity"})
public class RecruiterAppStarter {

	
	//private static ApplicationContext applicationContext;
	public static void main(String[] args) {
		SpringApplication.run(RecruiterAppStarter.class, args);

//		applicationContext = new AnnotationConfigApplicationContext(GetSetGoCoreApplication.class);
//
//		for (String beanName : applicationContext.getBeanDefinitionNames()) {
//			System.out.println(beanName);
//		}	
	}
}