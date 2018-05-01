package com.niit.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.DAO.CategoryDAO;
import com.niit.DAO.ProductDAO;
import com.niit.domain.Category;
import com.niit.domain.Product;

@Controller
public class HomeController 
{
      @Autowired
      private CategoryDAO categoryDao;
 
      @Autowired
      HttpSession httpSession;
      
      @Autowired
      private ProductDAO productDao;
      
      @RequestMapping(value="/")
      public ModelAndView home()
      {
    	  List<Product> prodlist=productDao.productList(); //to refresh  the list of products in dropdown
  		httpSession.setAttribute("prodlist",prodlist);
  		
    	List<Category> catList =  categoryDao.getCategoriesList();//to refresh the categories in header
  		httpSession.setAttribute("catList", catList);
  		
    	  ModelAndView mv=new ModelAndView("Home"); //will navigate to home page
    	  mv.addObject("carousel",true);   // used to add caraousel on home page 
    	  return mv;
      }
      
      @RequestMapping(value="/Home")
      public ModelAndView homearticles()
      {
    	  
    	  ModelAndView mv=new ModelAndView("redirect:/"); //on clicking on home redirects to d same home page
    	 /* mv.addObject("carousel",true);*/
    	  return mv;
      }
      
      @RequestMapping("/adminhome")
      public ModelAndView admin()
      {
    	  ModelAndView mv=new ModelAndView("Home");
    	  mv.addObject("adminhomeclicked", true);
    	  return mv;
      }
      
      
      @RequestMapping(value="/gologin") //mentioned in href of home.jsp (login option )
      public ModelAndView login()
      {
    	  ModelAndView mv=new ModelAndView("Home");
    	  mv.addObject("clickedlogin", true);
    	  return mv;
      }
      
      @RequestMapping("/register")   // same as gotologin
      public ModelAndView register()
      {
    	  ModelAndView mv=new ModelAndView("Home");
    	  mv.addObject("clickedsignup", true);
    	  return mv;
    	  
      }
}
