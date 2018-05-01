package com.niit.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.DAO.CartDAO;
import com.niit.DAO.ProductDAO;
import com.niit.domain.Cart;
import com.niit.domain.Product;

@Controller
public class CartController 
{

	@Autowired
	private CartDAO cartdao;
	
	@Autowired
	private ProductDAO productdao;
	
	@Autowired
	private Cart cart;
	
	@Autowired
	HttpSession httpSession;
	
	@RequestMapping("/addtocart")
	public ModelAndView addcart(@RequestParam String pid)
	{
		ModelAndView mv=new ModelAndView("Home");
		Product p=productdao.getProduct(pid);
		String useremail=(String) httpSession.getAttribute("userLoggedIn");
		cart.setUseremail(useremail);
		cart.setProductid(pid);
		cart.setProductdescription(p.getPdescription());
		cart.setProductprice(p.getPprice());
        cart.setProductname(p.getPname());
        cart.setQuantity(1);
        cart.setAmount(p.getPprice()*1);
        
        if(cartdao.saveCart(cart))
        {
        	mv.addObject("addedtocart",true);
        	List<Cart> usercart = cartdao.CartList(useremail);
        	httpSession.setAttribute("cartlist", usercart);
        	return mv;
        }
        else
        {
        	mv.addObject("crtmsg","not added to cart");
        	return mv;
        }
	}
}
