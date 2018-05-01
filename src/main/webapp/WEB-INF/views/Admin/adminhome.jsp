<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 -->
<title>Insert title here</title>
</head>
<body>
<br>
 <a href="managecategories">Manage Category</a>
  <a href="managesuppliers">Manage Supplier</a>
   <a href="manageproducts">Manage Product</a>
   
   <c:if test="${ managecategoriesclicked==true}"><jsp:include page="category.jsp"></jsp:include>
   </c:if>
   
   <c:if test="${managesuppliersclicked==true}"><jsp:include page="supplier.jsp"></jsp:include>
   </c:if>
   
   <c:if test="${manageproductsclicked==true}"><jsp:include page="product.jsp"></jsp:include>
   </c:if>
</body>
</html>