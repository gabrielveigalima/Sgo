<%-- 
    Document   : sair
    Created on : 12/06/2018, 10:48:41
    Author     : gabriel.lima
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SAIR</title>
    </head>
    <body>
        <%
            HttpSession sessao = request.getSession();
            session.setAttribute("msg", "<div class='bg-success'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Deslogado com segurança.</h4></div><br>");
            session.setAttribute("user", null);
            session.setAttribute("id", null);
            session.setAttribute("nivel", null);
        %>
        <c:redirect url="../index.jsp"></c:redirect>
        
        
    </body>
</html>