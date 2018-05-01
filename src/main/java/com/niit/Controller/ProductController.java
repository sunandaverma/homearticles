package com.niit.Controller;

import java.util.List;




import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.niit.DAO.CategoryDAO;
import com.niit.DAO.ProductDAO;
import com.niit.DAO.SupplierDAO;
import com.niit.Util.FileUtil;
import com.niit.domain.Category;
import com.niit.domain.Product;
import com.niit.domain.Supplier;

@Controller
public class ProductController
{
	@Autowired
	private ProductDAO productdao;
	
	@Autowired
	Product product;
	
	@Autowired
	private SupplierDAO supplierdao;
	
	@Autowired
	private CategoryDAO categorydao;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private FileUtil fileUtil;
	
	@PostMapping("/addproduct")
	public ModelAndView addproducts(@RequestParam("pid")String pid ,@RequestParam("pname")String pname,
			@RequestParam("pdescription")String pdescription,@RequestParam("pprice") int pprice,
			@RequestParam("file") MultipartFile file,@RequestParam("category") String categoryid,
			@RequestParam("supplier") String supplierid)
	{
		ModelAndView mv=new ModelAndView("redirect:/manageproducts");
		product.setPid(pid);
		product.setPname(pname);
		product.setPdescription(pdescription);
		product.setPprice(pprice);
		product.setCategoryid(categoryid);
		product.setSupplierid(supplierid);
				
		List<Category> catList =  categorydao.getCategoriesList();
		session.setAttribute("catList", catList);
		
		List<Supplier> supplist=supplierdao.getSupplierList();
		session.setAttribute("supplist", supplist);
		
		boolean flag=productdao.saveProduct(product);
		
		if(flag==true)
		{
			boolean	pic=fileUtil.fileCopyNIO(file, pid+".PNG");
			if(pic)
			{
				mv.addObject("prodimagemsg", "image uploaded ");
			}
			
			else
			{
				mv.addObject("prodimagemsg", "image not uploaded ");
			}
			mv.addObject("ProductMessage", "Successfully Added...");
			return mv;
		}
		else
		{
			mv.addObject("ProductMessage", "Successfully not Added...");
			return mv;
		}
	}
	
	@RequestMapping("/editproduct")
	public ModelAndView editproducts(@RequestParam String pid) 
	{
		ModelAndView mv=new ModelAndView("redirect:/manageproducts");
		session.setAttribute("editclicked", true);
		Product p =  productdao.getProduct(pid);
		session.setAttribute("selectedproduct", p);
		return mv;
		
	}
	
	@PostMapping("/updateproduct")
	public ModelAndView updateproducts(@RequestParam("pid")String pid ,@RequestParam("pname")String pname,
			@RequestParam("pdescription")String pdescription,@RequestParam("pprice") int pprice,
			@RequestParam("file") MultipartFile file,@RequestParam("category") String categoryid,
			@RequestParam("supplier") String supplierid)
	{
		ModelAndView mv=new ModelAndView("redirect:/manageproducts");
		product.setPid(pid);
		product.setPname(pname);
		product.setPdescription(pdescription);
		product.setPprice(pprice);
		product.setCategoryid(categoryid);
		product.setSupplierid(supplierid);
				
		List<Category> catList =  categorydao.getCategoriesList();
		session.setAttribute("catList", catList);
		
		List<Supplier> supplist=supplierdao.getSupplierList();
		session.setAttribute("supplist", supplist);
		
		boolean flag=productdao.updateProduct(product);
		
		if(flag==true)
		{
			boolean	pic=fileUtil.fileCopyNIO(file, pid+".PNG");
			if(pic)
			{
				mv.addObject("prodimagemsg", "image uploaded ");
			}
			
			else
			{
				mv.addObject("prodimagemsg", "image not uploaded ");
			}
			mv.addObject("ProductMessage", "Successfully UPDATED...");
			return mv;
		}
		else
		{
			mv.addObject("ProductMessage", "Successfully not UPDATED...");
			return mv;
		}
	}

	
	@RequestMapping("/deleteproduct")
	public ModelAndView deletepro(@RequestParam String pid)
	{
		ModelAndView mv=new ModelAndView("redirect:/manageproducts");
		boolean flag=productdao.deleteProduct(pid);
		
		if(flag==true)
		{
			mv.addObject("delpromsg", "product deleted");
			return mv;
		}
		else
		{
			mv.addObject("delcatmsg", "product not deleted");
			return mv;
		}
	}
	
	@RequestMapping("/viewproduct")
	public ModelAndView view(@RequestParam String pid)
	{
		ModelAndView mv=new ModelAndView("Home");
	    Product p=productdao.getProduct(pid);
	    session.setAttribute("productclicked",p);
	    mv.addObject("singleproductclicked", true);
	    return mv;
	}

	
		
	
}
