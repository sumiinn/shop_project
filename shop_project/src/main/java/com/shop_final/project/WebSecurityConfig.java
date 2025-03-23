package com.shop_final.project;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig {
	@Bean
	public PasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
		// BCrypt라는 해시 함수를 이용하여 패스워드를 암호화하는 구현체 
	}
	
	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		http
		.csrf(csrf-> csrf.disable())
		.formLogin(formLogin -> formLogin.disable())
        .headers(headerConfig -> headerConfig.frameOptions(frameOptionsConfig ->
        		frameOptionsConfig.disable()));

		return http.build();
	}
}
