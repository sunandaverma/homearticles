package com.niit.Controller;

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

@Controller
public class ProductController
{
	@Autowired
	private ProductDAO productdao;
	
	@Autowired
	private SupplierDAO supplierdao;
	
	@Autowired
	private CategoryDAO categorydao;
	
	@Autowired
	private FileUtil fileutil;
	
	@Autowired
	private HttpSession session;
	
	@PostMapping("/addproduct")
	public ModelAndView addproducts(@RequestParam("pid")String pid ,@RequestParam("pname")String pname,
			@RequestParam("pdescription")String pdescription,@RequestParam("pprice")String pprice,
			@RequestParam("file") MultipartFile file,@RequestParam("category") String cid, @RequestParam("supplier") String sid)
	{
		return null;
	}

}
