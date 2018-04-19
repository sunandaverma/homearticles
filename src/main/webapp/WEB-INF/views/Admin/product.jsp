<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
        <td><input style="width:100%;border:0;" type="text" value="" name="pid" autofocus placeholder="Product ID" required></td>
        
      </tr>
      <tr>
        <td><b>Product Name</b></td>
        <td><input style="width:100%;border:0;" type="text" value="" name="pname" placeholder="Product Name" required></td>
        
      </tr>
      <tr>
        <td><b>Product Description</b></td>
        <td><input style="width:100%;border:0;" type="text" value="" name="pdescription" placeholder="Product Description"></td>
      </tr>
      <tr>
      </tr>
      <tr>
        <td><b>Product Price</b></td>
        <td><input style="width:100%;border:0;" type="text" value="" name="pprice" placeholder="Product Price" required></td>
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
        		<option value="${cat.cid}">${cat.cname }</option>
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
        <td><button type="submit" class="btn btn-primary"> ADD </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button formaction="product/update" method="post" class="btn btn-primary"> UPDATE </button></td>
      </tr>
    </tbody>
  </table>
  </form>
</div>

</body>
</html>