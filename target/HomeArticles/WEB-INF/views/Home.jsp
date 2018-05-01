<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>home articles</title>
</head>
<body>
<nav class="navbar navbar-inverse" style="border-radius:0;">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="Home">Home Articles</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="Home">Home</a></li>
      
      <c:forEach items="${catList}" var="cat">
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">${cat.cname}<span class="caret"></span></a> <!-- display all categories name on header -->
        <ul class="dropdown-menu">
        <c:forEach items="${cat.products}" var="prod"> <!-- dispaly the products of those categories -->
         <li><a href="viewproduct?pid=${prod.pid}">${prod.pname}</a></li> <!-- on clicking on those products name details appear of that product -->
        </c:forEach>
         
        </ul>
      </li>
      </c:forEach>
     
    </ul>
    
    <ul class="nav navbar-nav navbar-right">
     <c:if test="${userloggedin==null}">    <!-- if not logged in then these both options will be displayed  -->
      <li><a href="register"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="gologin"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </c:if>
      
      
  <c:if test="${userloggedin==true}">  <!-- if logged in then logout  -->
  <c:if test="${admin==true}">
  <li><a href="adminhome"><span class="glyphicon glyphicon-earth"></span> Admin Home</a></li>
  </c:if>     
       <li><a href="gologout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    </c:if>      
    </ul>
  </div>
</nav>
  
${loginmessage }

<c:if test="${carousel==true }"><jsp:include page="carousel.jsp"></jsp:include> <!-- all pages below(needed) are included on a single page i.e,Home page called SPA. -->
</c:if>


<c:if test="${clickedlogin==true }"><jsp:include page="login.jsp"></jsp:include>
</c:if>

<c:if test="${clickedsignup==true }"><jsp:include page="registration.jsp"></jsp:include>
</c:if>

<c:if test="${added==true }"><jsp:include page="login.jsp"></jsp:include>
</c:if>

<c:if test="${isAdmin==true }"><jsp:include page="Admin/adminhome.jsp"></jsp:include>
</c:if>

 <c:if test="${ managecategoriesclicked==true}"> <jsp:include page="Admin/adminhome.jsp"></jsp:include>
 </c:if> 
  
   <c:if test="${ managesuppliersclicked==true}"> <jsp:include page="Admin/adminhome.jsp"></jsp:include>
 </c:if>
   
 <c:if test="${ manageproductsclicked==true}"> <jsp:include page="Admin/adminhome.jsp"></jsp:include>
 </c:if>
 
 <c:if test="${adminhomeclicked==true}"> <jsp:include page="Admin/adminhome.jsp"></jsp:include>
 </c:if>
 
  <c:if test="${singleproductclicked==true}"> <jsp:include page="selectproduct.jsp"></jsp:include>
 </c:if>
 
  <c:if test="${addedtocart==true}"> <jsp:include page="cart.jsp"></jsp:include>
 </c:if>
</body>
</html>