package com.lucasko.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lucasko.model.User;
 
@Controller
@RequestMapping("/api")
public class APIsController {
 
	@RequestMapping(value = "/users", method ={  RequestMethod.GET ,  RequestMethod.POST })
	@ResponseBody
	public List<User> users( HttpServletRequest request ,  Principal principal ) {
		System.out.println("username:"+principal.getName());  
		
		List<User> userList = new ArrayList<User>();
		userList.add(new User(1, "user001", "user001@example.com", "0123456789"));
		userList.add(new User(2, "user002", "user002@example.com", "9876543210"));
	   
		if(	request.isUserInRole("ROLE_ADMIN") )
		{
			userList.add(new User(3, "admin001", "admin001@example.com", "1111111111"));	
			userList.add(new User(3, "admin002", "admin002@example.com", "2222222222"));	
			userList.add(new User(3, "admin003", "admin003@example.com", "3333333333"));	
			userList.add(new User(3, "admin004", "admin004@example.com", "4444444444"));
		}
			
		return userList;

	}
}
