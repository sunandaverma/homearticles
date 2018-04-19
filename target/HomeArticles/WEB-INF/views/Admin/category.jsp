<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<tr>
        <td><b>Category ID</b></td>
        <td><input style="width:100%;border:0;" type="text" value="" name="cid" placeholder="ID" required></td> 
      </tr>
      
      <tr>
        <td><b>Category Name</b></td>
        <td><input  style="width:100%;border:0;" type="text" value="" name="cname" placeholder="Name" required></td>        
      </tr>
      
      <tr>
        <td><b>Category Description</b></td>
        <td><input style="width:100%;border:0;" type="text" value="" name="cdescription" placeholder="Description"></td>
      </tr>
      
      <tr>
        <td></td>
        <td><button type="submit" class="btn btn-primary"> ADD </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <button formaction="category/update" method="post" class="btn btn-primary"> UPDATE </button></td>
      </tr>
</body>
</html>