package com.niit.Controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.DAO.UserDAO;
import com.niit.domain.User;

@Controller
public class UserController 
{
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	HttpSession httpSession;
	
	@Autowired
	private User user;
	
	@PostMapping("/validate")
	public ModelAndView validate(@RequestParam("email") String email, @RequestParam("pwd") String pwd)
	{
		ModelAndView mv = new ModelAndView("Home");
		httpSession.setAttribute("loggedIn", true);
		User user = userDAO.validateUser(email, pwd);
		String username = user.getUsername();
		mv.addObject("loginmessage", "welcome "+ username);
		
		
			if(user.getRole()=='A')
			{
				mv.addObject("isAdmin", true); //for including the page
				httpSession.setAttribute("admin", true); // for adminhome link in header
			}
			
			else if (user.getRole()=='C')
			{
				mv.setViewName("Home");
				mv.addObject("carousel", true);
			}
			return mv;
		}
	
	@PostMapping("/savedata")
	public ModelAndView savedata(@RequestParam("email") String email,@RequestParam("username") String username,
			                     @RequestParam("password") String password,@RequestParam("mobile") String mobile,@RequestParam("address") String address)
	{
		
		ModelAndView mv = new ModelAndView("Home");
		user.setEmail(email);
		user.setMobile(mobile);
		user.setPassword(password);
		user.setRegistrationdate(new Date());
		user.setUsername(username);
		user.setAddress(address);
		user.setRole('C');
		
		boolean flag=userDAO.saveOrUpdate(user);
		
		if(flag==true)
		{
		mv.addObject("signupmsg", "data added");
		mv.addObject("added",true);
		return mv;
		}
		
		else
		{
		 mv.addObject("signupmsg", "user not added...");
		 return mv;
		}
	}
		
		@RequestMapping("/gologout")
		public ModelAndView logout()
		{
			ModelAndView mv=new ModelAndView("redirect:/");
			httpSession.removeAttribute("loggedIn");
			httpSession.removeAttribute("admin");
			return mv;
			
		}
		
		
	
	
}
