package com.example.demo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class SessionInterceptor   implements HandlerInterceptor  {

    @Override
    public boolean preHandle(
            HttpServletRequest    request 
            , HttpServletResponse response 
            , Object handler
    ) throws Exception {
        
        HttpSession session = request.getSession();   
        String uuid = (String)session.getAttribute("uuid");    

        if(uuid==null) {    
            response.sendRedirect( "/login" );
            return false;
        }
        else{ 
            return true;
        }
    }
    
}