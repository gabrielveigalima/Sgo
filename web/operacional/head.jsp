<%-- 
    Document   : head
    Created on : 06/06/2018, 09:55:39
    Author     : gabriel.lima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${not sessionScope.nivel == '1'}">    
    <% 
        HttpSession sessao = request.getSession();
        sessao.setAttribute("msg", "<div class='bg-danger'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Acesso negado!</h4></div><br>");        
    %>
    <c:redirect url="../index.jsp"></c:redirect>
</c:if>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="gabriel.lima">
    <link  rel="icon" href="../img/icon.png"/>
    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.css" rel="stylesheet">
 