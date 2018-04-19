package com.niit.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.DAO.CategoryDAO;

@Controller
public class HomeController 
{
      @Autowired
      private CategoryDAO categoryDao;
 
      @Autowired
      HttpSession httpSession;
      
      @RequestMapping(value="/")
      public ModelAndView home()
      {
    	  
    	  ModelAndView mv=new ModelAndView("Home");
    	  mv.addObject("carousel",true);
    	  return mv;
      }
      
      @RequestMapping(value="/Home")
      public ModelAndView homearticles()
      {
    	  
    	  ModelAndView mv=new ModelAndView("redirect:/");
    	 /* mv.addObject("carousel",true);*/
    	  return mv;
      }
      
      
      @RequestMapping(value="/gologin")
      public ModelAndView login()
      {
    	  ModelAndView mv=new ModelAndView("Home");
    	  mv.addObject("clickedlogin", true);
    	  return mv;
      }
      
      @RequestMapping("/register")
      public ModelAndView register()
      {
    	  ModelAndView mv=new ModelAndView("Home");
    	  mv.addObject("clickedsignup", true);
    	  return mv;
    	  
      }
}
