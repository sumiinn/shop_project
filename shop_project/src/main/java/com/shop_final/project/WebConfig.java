package com.shop_final.project;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// 프로젝트 외부 경로 이미지 맵핑 설정 
		// 맵핑 이름 : project_images
		registry.addResourceHandler("/project_images/**")
		//.addResourceLocations("file:///D:/springWorkspace/semi_project_images/");
		.addResourceLocations("file:/home/ubuntu/semi_project_images/");
	}
}