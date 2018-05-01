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

<div class="container">      
  <form action="addproduct" method="post" enctype="multipart/form-data">  
  <br><br>  
  <table class="table table-hover">
    <tbody>
      <tr>
        <td><b>Product ID</b></td>
        <td><input style="width:100%;border:0;" type="text" value="${selectedproduct.pid }" name="pid" autofocus placeholder="Product ID" required></td>
        
      </tr>
      <tr>
        <td><b>Product Name</b></td>
        <td><input style="width:100%;border:0;" type="text" value="${selectedproduct.pname}" name="pname" placeholder="Product Name" required></td>
        
      </tr>
      <tr>
        <td><b>Product Description</b></td>
        <td><input style="width:100%;border:0;" type="text" value="${selectedproduct.pdescription }" name="pdescription" placeholder="Product Description"></td>
      </tr>
      <tr>
      </tr>
      <tr>
        <td><b>Product Price</b></td>
        <td><input style="width:100%;border:0;" type="text" value="${selectedproduct.pprice}" name="pprice" placeholder="Product Price" required></td>
      </tr>
      <tr>
        <td><b>Product Image</b></td>
        <td><input style="width:100%;border:0;" type="file" <%-- value="${Selectedproduct.pprice}" --%> name="file"></td>
      </tr>    
        <tr>
        <td><b>Product Category</b></td>
        <td>
        <select style="width:100%;border:0;" name="category">
        	<c:forEach var="cat" items="${catList}">
        		<option value="${cat.cid}">${cat.cname}</option>
        	</c:forEach>      
        </select>
 		</td>
      </tr>
      <tr>
      <td><b>Supplier</b></td>
        <td>
        <select style="width:100%;border:0;" name="supplier">
        	<c:forEach var="supp" items="${supplist }">
        		<option value="${supp.sid}">${supp.sname}</option>  
        	</c:forEach>      
        </select>
        </td>
      </tr>
      <tr>
        <td></td>
        <td><button type="submit" class="btn btn-primary"> ADD </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <button formaction="updateproduct" method="post" class="btn btn-primary"> UPDATE </button></td>
      </tr>
    </tbody>
  </table>
  </form>
</div>


<div class="container">
 		<table class="table table-bordered" style="text-align:center;" border="3px">
 		<tr>
 		<td bgcolor="cyan"><b>PRODUCT ID</b></td>
 		<td bgcolor="cyan"><b>PRODUCT NAME</b></td>
 		<td bgcolor="cyan"><b>PRODUCT DESCRIPTION</b></td>
 		<td bgcolor="cyan"><b>PRODUCT PRICE</b></td>
 		<td bgcolor="cyan"><b>CATEGORY ID</b></td>
 		<td bgcolor="cyan"><b>SUPPLIER ID</b></td>
 		<td bgcolor="cyan"><b>ACTION</b></td>
 		</tr>
		<c:forEach var="prod" items="${prodlist}">
			<tr>
				<td>${prod.pid}</td>
				<td>${prod.pname}</td>
				<td>${prod.pdescription}</td>
				<td>${prod.pprice}</td>
				<td>${prod.categoryid}</td>
				<td>${prod.supplierid}</td>
				<td><a id="a01" href="deleteproduct/?pid=${prod.pid}">Delete</a> |
				<a id="a01" href="editproduct/?pid=${prod.pid}">Edit</a></td>
			</tr>
		</c:forEach>
		</table> 
	</div>

</body>
</html>