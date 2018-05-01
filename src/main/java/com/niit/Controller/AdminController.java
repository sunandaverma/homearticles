package com.niit.Controller;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.DAO.CategoryDAO;
import com.niit.DAO.ProductDAO;
import com.niit.DAO.SupplierDAO;
import com.niit.domain.Category;
import com.niit.domain.Product;
import com.niit.domain.Supplier;

@Controller
public class AdminController
{
	@Autowired
	private CategoryDAO categorydao;
	
	@Autowired
	private SupplierDAO supplierdao;
	
	@Autowired
	private ProductDAO productdao;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/managecategories")
	public ModelAndView managecategory()
	{
		
		ModelAndView mv=new ModelAndView("Home");
		mv.addObject("managecategoriesclicked", true);
		List<Category> catList =  categorydao.getCategoriesList();
		session.setAttribute("catList", catList);
		return mv;
	}
	
	@RequestMapping("/managesuppliers")
	public ModelAndView managesupplier()
	{
		ModelAndView mv=new ModelAndView("Home");
		mv.addObject("managesuppliersclicked",true);
		List<Supplier> supplist=supplierdao.getSupplierList();
		session.setAttribute("supplist", supplist);
		return mv;
	}
	
	@RequestMapping("/manageproducts")
	public ModelAndView manageproduct()
	{
		ModelAndView mv=new ModelAndView("Home");
		mv.addObject("manageproductsclicked",true);
		
		List<Product> prodlist=productdao.productList();
		session.setAttribute("prodlist",prodlist);
				
		List<Category> catList =  categorydao.getCategoriesList(); //refresh the list of categories and supplier
		session.setAttribute("catList", catList);
		
		List<Supplier> supplist=supplierdao.getSupplierList();
		session.setAttribute("supplist", supplist);
		return mv;
	}

}
