package com.example.demo.login;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	@RequestMapping( value="/login")
	public String login(
		HttpSession session
	){
		System.out.println("LoginController -- login");
		session.removeAttribute("mid");
		return "login";
    }

	@RequestMapping( value="/signup")
	public String signup(
		HttpSession session
	){
		System.out.println("LoginController -- signup");
		session.removeAttribute("mid");
		return "signup";
    }
	
}
