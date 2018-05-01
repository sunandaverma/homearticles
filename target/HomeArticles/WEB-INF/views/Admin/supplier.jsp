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

<div class="container">
    <form action="addsupplier" method="post">  
  <table class="table table-hover">
   
      <tr>
        <td> Supplier id</td>
        <td> <input type ="text" name="sid" value="${selectedsupplier.sid}"> </td>
      </tr>
      
            <tr>
        <td> Supplier name</td>
        <td> <input type ="text" name="sname" value="${selectedsupplier.sname}"> </td>
      </tr>
      
            <tr>
        <td> Supplier address</td>
        <td> <input type ="text" name="saddress" value="${selectedsupplier.saddress}"> </td>
      </tr>
      
        <tr>
        <td></td>
        <td> <button class="btn btn-primary" type="submit">ADD</button>
         <button class="btn btn-primary" formaction="updatesupplier" method="post">UPDATE</button></td>
      </tr>
  </table>
  </form>  
</div>



<div class="container">
 		<table class="table table-bordered" style="text-align:center;" border="3px">
 		<tr>
 		<td bgcolor="cyan"><b>SUPPLIER ID</b></td>
 		<td bgcolor="cyan"><b>SUPPLIER NAME</b></td>
 		<td bgcolor="cyan"><b>SUPPLIER ADDRESS</b></td>
 		<td bgcolor="cyan"><b>ACTION</b></td>
 		</tr>
		<c:forEach var="supp" items="${supplist}">
			<tr>
				<td>${supp.sid}</td>
				<td>${supp.sname}</td>
				<td>${supp.saddress}</td>
				<td><a id="a01" href="deletesupplier/?sid=${supp.sid}">Delete</a> |
				<a id="a01" href="editsupplier/?sid=${supp.sid}">Edit</a></td>
			</tr>
		</c:forEach>
		</table> 
	</div>

</body>
</html>