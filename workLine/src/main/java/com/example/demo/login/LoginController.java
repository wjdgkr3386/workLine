package com.example.demo.login;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

	@GetMapping( value="/login")
	public String login(
		HttpSession session
	){
		System.out.println("LoginController -- login");
		session.removeAttribute("mid");
		return "login";
    }

	@GetMapping( value="/signup")
	public String signup(
		HttpSession session
	){
		System.out.println("LoginController -- signup");
		session.removeAttribute("mid");
		return "signup";
    }
	
}
