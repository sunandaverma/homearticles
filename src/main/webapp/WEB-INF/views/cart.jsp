<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<p style="margin:0px 20px;font-size:30px;font-family:tahoma;">Items in Your Cart</p>

<form action="checkout" method="post">
  <table style="text-align:center;"  class="table">		<!-- border="1px" -->
    <thead style="background-color:slategray;color:white;">
      <tr>
        <th style="width:10%;">Cart id</th>
        <th style="text-align:center;">Product</th>
        <th style="width:30%;">Product Name</th>
        <th style="width:10%;">Price</th>
        <th style="width:10%;">Quantity</th>
        <th style="width:10%;">Amount</th>
        <th></th>
      </tr>
    </thead>
    
    <tbody>
    <c:forEach var="cartlist" items="${cartlist}">
      <tr>
     	 <td><input type="text" readonly style="text-align:center;width:40%;" value="${cartlist.cartid}" name="cartid"></td>
     	 <td style="width:15%;"><img style="height:130px;width:220px;padding:20px;" alt="" src="resources/productImages/${cartlist.productid}.PNG"></td>
     	 <td style="padding:10px 20px;">${cartlist.productname}</td>
      	 <td>${cartlist.productprice}</td>
      	 <td style="width:15%;">
      	 	<button type=submit class="btn btn-default" formaction="reduce?cartid=${cartlist.cartid}" method="post"> - </button>
			<input type="text" style="text-align:center;width:20%;" name="cartquantity" readonly value="${cartlist.quantity }">
			<button type="submit" class="btn btn-default" formaction="add?cartid=${cartlist.cartid}" method="post"> + </button>
		</td>
		
		<td>${cartlist.amount }</td>
		<td><button style="width:50%;" class="btn btn-danger" formaction="deleteFromCart?cartid=${cartlist.cartid}" method="post"> Delete </button></td>
		
      </tr>
     </c:forEach>
    </tbody>
   
  </table>
  <hr><br>
  </form>
  <p style="margin:0px 20px;">//////error msg for balance </p>
  
<p style="text-align:right;margin:0px 40px;">
					<a style="width:10%" class="btn btn-primary" href="checkout"> Check Out </a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a style="width:10%" class="btn btn-warning" href="emptyCart"> Empty Cart </a>			
</p>




	<div style="margin: 0px 100px;">
	<form action="checkout" method="post">
	<c:forEach var="cart" items="${userCart}">	
	<table style="background-color:ghostwhite;">	
	<tr>
		<td rowspan="4" style="width:20%;"><img style="height:150px;width:250px;" alt="${cart.productname}" src="resources/images/${cart.productid}.PNG"></td>			
		<td style="width:5%;"></td>
		<td><b>Cart ID: </b></td>
		<td>${cart.cartid}</td>
		<td><button style="width:100%;" class="btn btn-info" formaction="deleteFromCart?cartid=${cart.cartid}" method="post"> Delete </button></td>
	</tr>
	<tr>
		<td></td>
		<td><b>Product Price: </b></td>
		<td>${cart.productprice}</td>
	</tr>
	<tr>
		<td></td>
		<td><b>Product Description: </b></td>
		<td style="width:40%;">${cart.productdescription}</td>
	</tr>
	<tr>
		<td></td>
		<td style="width:15%;"><b>Quantity </b><small>(can be adjusted)</small><b>:</b></td>
		<td>
			<button type=submit class="btn btn-default" formaction="reduce?cartid=${cart.cartid}" method="post"> - </button>
			<input type="text" style="width:15%;text-align:center;" name="cartquantity" value="${cart.quantity}">
			<button type="submit" class="btn btn-default" formaction="add?cartid=${cart.cartid}" method="post"> + </button>
		</td>
	</tr>
	</table>
			<hr>
			</c:forEach>
			<br><a class="btn btn-success" href="checkout"> Checkout </a>
				<a class="btn btn-danger" href="#"> Empty Cart </a>
			</form>
	</div>

</body>
</html>