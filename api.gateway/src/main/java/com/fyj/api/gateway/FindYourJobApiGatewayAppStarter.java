package com.fyj.api.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableEurekaClient
@EnableZuulProxy
@ComponentScan("com.fyj.api.gateway")
@EnableJpaRepositories(basePackages = {"com.fyj.api.gateway.repo"})
@EnableTransactionManagement
@EntityScan(basePackages = {"com.fyj.api.gateway.entity"})
public class FindYourJobApiGatewayAppStarter {

	public static void main(String[] args) {
		SpringApplication.run(FindYourJobApiGatewayAppStarter.class, args);
	}

}
