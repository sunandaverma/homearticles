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
  <table class="table table-bordered">
<br><br>
    <tbody>
      <tr>
        <td><b>Supplier ID</b></td>
        <td><input style="width:100%;border:0;" type="text" value="${selectedsupplier.sid}" name="sid" autofocus placeholder="ID" required></td>
      </tr>
      <tr>
        <td><b>Supplier Name</b></td>
        <td><input style="width:100%;border:0;" type="text" value="${selectedsupplier.sname}" name="sname" placeholder="Name" required></td>
      </tr>
      <tr>
        <td><b>Supplier Address</b></td>
        <td><input style="width:100%;border:0;" type="text" value="${selectedsupplier.saddress}" name="saddress" placeholder="Address"></td>
      </tr>
      
      <tr>
        <td></td>
        <td><button type="submit" class="btn btn-primary"> ADD </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <button   class="btn btn-primary  formaction="updatesupplier" method="post"> UPDATE </button></td>
      </tr>
    </tbody>
  </table>
  </form>
</div>
<br><br>

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