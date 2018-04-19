<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Home Articles</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse" style="border-radius:0;">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="Home">Home Articles</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Page 1-1</a></li>
          <li><a href="#">Page 1-2</a></li>
          <li><a href="#">Page 1-3</a></li>
        </ul>
      </li>
      <li><a href="#">Page 2</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
     <c:if test="${loggedIn==null}"> 
      <li><a href="register"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="gologin"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </c:if>
  <c:if test="${loggedIn==true}"> 
       <li><a href="gologout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    </c:if>      
    </ul>
  </div>
</nav>
  
${loginmessage }

<c:if test="${carousel==true }"><jsp:include page="carousel.jsp"></jsp:include>
</c:if>


<c:if test="${clickedlogin==true }"><jsp:include page="login.jsp"></jsp:include>
</c:if>

<c:if test="${clickedsignup==true }"><jsp:include page="registration.jsp"></jsp:include>
</c:if>

<c:if test="${added==true }"><jsp:include page="login.jsp"></jsp:include>
</c:if>

<c:if test="${isAdmin==true }"><jsp:include page="Admin/adminhome.jsp"></jsp:include>
</c:if>

 <c:if test="${ managecategoriesclicked==true}">
   <jsp:include page="Admin/adminhome.jsp"></jsp:include>
   </c:if>
</body>
</html>