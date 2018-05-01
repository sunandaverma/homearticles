package com.niit.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.DAO.SupplierDAO;
import com.niit.domain.Supplier;




@Controller
public class SupplierController
{
@Autowired
Supplier supplier;
	
@Autowired
SupplierDAO supplierdao;

@Autowired
HttpSession session;

@PostMapping("/addsupplier")
public ModelAndView addS(@RequestParam("sid") String sid,@RequestParam("sname") String sname,@RequestParam("saddress") String saddress)
{
	ModelAndView mv=new ModelAndView();
	supplier.setSid(sid);
	supplier.setSname(sname);
	supplier.setSaddress(saddress);
	
	boolean flag = supplierdao.saveSupplier(supplier);
	
	if(flag==true)
	{
		mv.addObject("supplieraddmsg", "supplier added successfully");
		mv.setViewName("redirect:/managesuppliers");
		return mv;
	}
	else
	{
		mv.addObject("supplieraddmsg", "supplier not added successfully");
		mv.setViewName("redirect:/managesuppliers");
		return mv;
	}
}

@PostMapping("/updatesupplier")
public ModelAndView updateS(@RequestParam("sid") String sid,@RequestParam("sname") String sname,@RequestParam("saddress") String saddress)
{
	ModelAndView mv=new ModelAndView();
	supplier.setSid(sid);
	supplier.setSname(sname);
	supplier.setSaddress(saddress);
	
	boolean flag = supplierdao.updateSupplier(supplier);
	
	if(flag==true)
	{
		mv.addObject("supplierupdatemsg", "supplier updated successfully");
		mv.setViewName("redirect:/managesuppliers");
		return mv;
	}
	else
	{
		mv.addObject("supplierupdatemsg", "supplier not updated successfully");
		mv.setViewName("redirect:/managesuppliers");
		return mv;
	}
}

@RequestMapping("/editsupplier")
public ModelAndView editsupp(@RequestParam String sid)
{
	
	ModelAndView mv=new ModelAndView("redirect:/managesuppliers");
	session.setAttribute("updateclicked", true);
	Supplier sup =  supplierdao.getSupplier(sid);
	session.setAttribute("selectedsupplier", sup);
	return mv;
}

@RequestMapping("/deletesupplier")
public ModelAndView deletesupp(@RequestParam String sid)
{
	ModelAndView mv=new ModelAndView("redirect:/managesuppliers");
	boolean flag=supplierdao.deleteSupplier(sid);
	
	if(flag==true)
	{
		mv.addObject("delsuppmsg", "supplier deleted");
		return mv;
	}
	else
	{
		mv.addObject("delsuppmsg", "supplier not deleted");
		return mv;
	}
}
}


