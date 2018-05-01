<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>select products</title>
</head>
<body>

<div class="container">
    <div class="row">
    <form action="addtocart?pid=${productclicked.pid}" method="post">
         <div class="col-xs-4 item-photo">
             <img alt="${productclicked.pname}" style="height:300px;width:300px;" src="resources/productimages/${productclicked.pid}.PNG">
             </div>
                <div class="col-xs-5" style="border:0px solid gray">
                   
                    <h3>${productclicked.pname}</h3>    
                    <h5 style="color:#337ab7"><a href="#">${productclicked.pprice}</a></h5>
        
                    <div class="section" style="padding-bottom:20px;">
                      <button class="btn btn-success" type="submit"><span style="margin-right:20px" class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>  ADD TO CART</button>
               		</div>                                        
         		</div>
    </form>
	</div> 
</div>
</body>
</html>