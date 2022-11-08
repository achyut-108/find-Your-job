package com.fyj.starter;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
//@EnableEurekaClient
@ComponentScan("com.fyj")
@EnableJpaRepositories(basePackages = {"com.fyj.repo"})
@EnableTransactionManagement
@EntityScan(basePackages = {"com.fyj.entity"})
public class FindYourJobApplication {

	
	//private static ApplicationContext applicationContext;
	public static void main(String[] args) {
		SpringApplication.run(FindYourJobApplication.class, args);

//		applicationContext = new AnnotationConfigApplicationContext(GetSetGoCoreApplication.class);
//
//		for (String beanName : applicationContext.getBeanDefinitionNames()) {
//			System.out.println(beanName);
//		}	
	}
}