<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

  <form action="addcategory" method="post">    
  <table class="table table-bordered">
<br><br>
    <tbody>
    
      <tr>
        <td><b>Category ID</b></td>
        <td><input style="width:100%;border:0;" type="text" value="${selectedcategory.cid }" name="cid" placeholder="ID" required></td> 
      </tr>
      
      <tr>
        <td><b>Category Name</b></td>
        <td><input  style="width:100%;border:0;" type="text" value="${selectedcategory.cname}" name="cname" placeholder="Name" required></td>        
      </tr>
      
      <tr>
        <td><b>Category Description</b></td>
        <td><input style="width:100%;border:0;" type="text" value="${selectedcategory.cdescription}" name="cdescription" placeholder="Description"></td>
      </tr>
      
      <tr>
        <td></td>
       
        <td><button type="submit" class="btn btn-primary"> ADD </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        <button  class="btn btn-primary" formaction="updatecategory" method="post"> UPDATE </button></td>
         
      </tr>
      
    </tbody>
  </table>
  </form>
  
  <div class="container">
 		<table class="table table-bordered" style="text-align:center;" border="3px">
 		<tr>
 		<td bgcolor="cyan"><b>CATEGORY ID</b></td>
 		<td bgcolor="cyan"><b>CATEGORY NAME</b></td>
 		<td style="width:60%;" bgcolor="cyan"><b>CATEGORY DESCRIPTION</b></td>
 		<td style="width:15%;" bgcolor="cyan"><b>ACTION</b></td>
 		</tr>
		<c:forEach items="${catList}" var="cat">
			<tr>
				<td>${cat.cid }</td>
				<td>${cat.cname }</td>
				<td>${cat.cdescription }</td>
				<td><a id="a01" href="deletecategory/?cid=${cat.cid}">Delete</a> |
				<a id="a01" href="editcategory/?cid=${cat.cid}">Edit</a></td>
			</tr>
		</c:forEach>
		</table> 
	</div>
</body>
</html>