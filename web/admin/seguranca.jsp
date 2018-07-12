<%-- 
    Document   : segurança
    Created on : 12/06/2018, 11:05:46
    Author     : gabriel.lima
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <% 
           //Verifica as sessões para saber se a pessoa logou
           if(session.getAttribute("nivel") == null || 
                   session.getAttribute("id") == null || 
                   session.getAttribute("user") == null){
                session.setAttribute("user", null);
                session.setAttribute("id", null);
                session.setAttribute("nivel", null);
                %>
                <script language= "JavaScript">
                    location.href="../index.jsp";
                </script>
                <% 
           }else{
                if(!session.getAttribute("nivel").equals("1")){
                    session.setAttribute("user", "<div class='bg-alert'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Você não tem permissão.</h4></div><br>");
                %> 
                     <script language= "JavaScript">
                        location.href="../index.jsp";
                    </script>
                    <%
                }
            }
        %>
         </body>
</html>