<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

  <!-- <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 -->
</head>

<body>

 <form action="savedata" method="post" >
							<label>Enter Name</label>
							<input  type="text" name="full_name" class="form-control" "/>
							
							<label>Enter Email</label>
							<input type="email" name="email" "/>
							
							<br>
							<label>Mobile Number</label>
							<input type="text" name="mobile" class="form-control" required="" pattern="[0-9]{10}" title="Enter a 10 digit mobile number" maxlength="10"/>
							
							<label>Create Username</label>
							<input name="username" type="text"/>
							
							<label>Create Password</label>
							<input type="password" name="password" />
							
							<label> Address</label>
							<input type="text" name="address" />
							
							
							<input type="submit" value="Sign Up" class="btn btn-primary btn-block"/>
							</form>

</body>
</html>