package com.devpro.javaweb22.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration// báo spring biết đây là file cấu hình cho MVC
public class MVCConf implements WebMvcConfigurer{
	@Override
public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		
		//ERROR: http://localhost:8080/css/styles.css 404
		//bất cứ request nào có dạng: http://localhost:8080/css/thumuccon/dcf.css sẽ vào folder src/main/resources/css
		//classpath: = /src/main/resources
		registry.addResourceHandler("/css/**").addResourceLocations("classpath:/css/");
		
		//ERROR: http://localhost:8080/js/scripts.js 404
		//bất cứ request nào có dạng: http://localhost:8080/js/thumuccon/dcf.js sẽ vào folder src/main/resources/js
		registry.addResourceHandler("/js/**").addResourceLocations("classpath:/js/");		
		registry.addResourceHandler("/images/**").addResourceLocations("classpath:/images/");
		registry.addResourceHandler("/fonts/**").addResourceLocations("classpath:/fonts/");
		registry.addResourceHandler("/vendors/**").addResourceLocations("classpath:/vendors/");
		registry.addResourceHandler("/docs/**").addResourceLocations("classpath:/docs/");
		registry.addResourceHandler("/build/**").addResourceLocations("classpath:/build/");
		registry.addResourceHandler("/src/**").addResourceLocations("classpath:/src/");


		//đăng kí thêm folder upload
		registry.addResourceHandler("/upload/**").addResourceLocations("file:" + "E:/upload/");
		
	}
	
	
	@Bean // báo cho spring biết đây là nơi chứa view
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class); // view engine để đọc data trả  về
		bean.setPrefix("/WEB-INF/views/");// Đường dẫn tới folder chứa view
		bean.setSuffix(".jsp");// đuôi file của view
		return bean;
	}
}
