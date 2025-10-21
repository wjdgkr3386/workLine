package com.example.demo.login;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//로그인 안하면 로그인 페이지로 리다이렉트
@Configuration
public class MyConfig implements WebMvcConfigurer{
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new SessionInterceptor())
            .addPathPatterns("/**") //인터셉터 적용 경로
            .excludePathPatterns(   //인터셉터 하지않을 경로
                "/login"
                ,"/loginProc"
                ,"/signup"
                ,"/signupProc"
                ,"/js/**"
                ,"/css/**"
        );
    }
}