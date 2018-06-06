<%-- 
    Document   : index
    Created on : 06/06/2018, 09:09:01
    Author     : gabriel.lima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="head.jsp"></c:import>
    <title>Admin - SGO</title>
  </head>
  <body>
  <c:import url="navbar.jsp"></c:import>  
  
    <div class="container">
        <div class='alert alert-warning'>
            <h4 class='text-center'>
                Área só para administrador!
            </h4>
        </div><br>
        <h1>
        <c:if test="${not empty sessionScope.user}">
            ${sessionScope.user}
        </c:if>
        </h1>
        <c:if test="${not empty sessionScope.id}">
            ${sessionScope.id}
        </c:if>
        <c:if test="${not empty sessionScope.nivel}">
            ${sessionScope.nivel}
        </c:if>
     

    </div><!-- /.container -->
<c:import url="footer.jsp"></c:import>


  