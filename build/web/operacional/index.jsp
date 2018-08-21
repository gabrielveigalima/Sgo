<%-- 
    Document   : index
    Created on : 05/06/2018, 12:10:21
    Author     : gabriel.lima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="seguranca.jsp"></c:import>
<c:import url="head.jsp"></c:import>
<title>Admin - SGO</title>
  </head>
  <body>
<c:import url="navbar.jsp"></c:import>  
    <div class="container">
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
    </div>
<c:import url="footer.jsp"></c:import>

