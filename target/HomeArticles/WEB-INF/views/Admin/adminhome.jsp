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
<br>
 <a href="managecategories">Manage Category</a>
  <a href="managesupplier">Manage Supplier</a>
   <a href="manageproduct">Manage Product</a>
   
   <c:if test="${ managecategoriesclicked==true}">
   <jsp:include page="category.jsp"></jsp:include>
   </c:if>
</body>
</html>