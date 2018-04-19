package com.niit.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.DAO.CategoryDAO;
import com.niit.domain.Category;

@Controller
public class CategoryController 
{
	
	@Autowired
	private Category category;
	
	@Autowired
	private CategoryDAO categorydao;
	
	@Autowired
	private HttpSession session;

	@PostMapping("/addcategory")
	public ModelAndView addC(@RequestParam("cid") String cid,@RequestParam("cname") String cname,@RequestParam("cdescription") String cdescription)
	{
		ModelAndView mv=new ModelAndView();
		category.setCid(cid);
		category.setCname(cname);
		category.setCdescription(cdescription);
		
		boolean flag = categorydao.saveCategory(category);
		
		if(flag==true)
		{
			mv.addObject("categoryaddmsg", "category added successfully");
			mv.setViewName("redirect:/managecategories");
			return mv;
		}
		else
		{
			mv.addObject("categoryaddmsg", "category not added successfully");
			mv.setViewName("redirect:/managecategories");
			return mv;
		}
	}
	
	@PostMapping("/updatecategory")
	public ModelAndView updateC(@RequestParam("cid") String cid,@RequestParam("cname") String cname,@RequestParam("cdescription") String cdescription)
	{
		ModelAndView mv=new ModelAndView();
		category.setCid(cid);
		category.setCname(cname);
		category.setCdescription(cdescription);
		
		boolean flag = categorydao.updateCategory(category);
		
		if(flag==true)
		{
			mv.addObject("categoryupdatemsg", "category updated successfully");
			mv.setViewName("redirect:/managecategories");
			return mv;
		}
		else
		{
			mv.addObject("categoryupdatemsg", "category not updated successfully");
			mv.setViewName("redirect:/managecategories");
			return mv;
		}
	}
	
	@RequestMapping("/editcategory")
	public ModelAndView editcat(@RequestParam String cid)
	{
		
		ModelAndView mv=new ModelAndView("redirect:/managecategories");
		session.setAttribute("updateclicked", true);
		Category c =  categorydao.getCategory(cid);
		session.setAttribute("selectedcategory", c);
		return mv;
	}
	
	@RequestMapping("/deletecategory")
	public ModelAndView deletecat(@RequestParam String cid)
	{
		ModelAndView mv=new ModelAndView("redirect:/managecategories");
		boolean flag=categorydao.deleteCategory(cid);
		
		if(flag==true)
		{
			mv.addObject("delcatmsg", "category deleted");
			return mv;
		}
		else
		{
			mv.addObject("delcatmsg", "category not deleted");
			return mv;
		}
	}
	
}
