<%-- 
    Document   : index
    Created on : 05/06/2018, 12:10:21
    Author     : gabriel.lima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SGO</title>
    </head>
    <body>
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
    </body>
</html>
