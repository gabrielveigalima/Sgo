<%-- 
    Document   : ponto
    Created on : 20/08/2018, 11:01:39
    Author     : gabriel.lima
--%>

<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="controller.CtrlUser"%>
<%@page import="model.User"%>
<%@page import="java.text.Normalizer"%>
<%@page import="model.Equipamento"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="controller.CtrlEquipamento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   HttpSession sessao = request.getSession(); 
%>
<c:import url="seguranca.jsp"></c:import>
<c:import url="head.jsp"></c:import>
        <title>Centro de Custo - Operacional - SGO</title>
    </head>
    <body>
        <c:import url="navbar.jsp"></c:import>  
        <div class="container">
            <h1>
                <c:if test="${not empty sessionScope.msg}">
                    ${sessionScope.msg}
                    <%
                        sessao.setAttribute("msg", null);
                    %>
                </c:if>
            </h1>
            <form method="post" action='ponto.jsp' class="form-inline jumbotron">
                <input type="hidden" value="selectFiltro" name="action">
                <div class="form-group">
                    <label for="exampleInputName2">Data</label>
                    <input name="data" type="date" class="form-control center-block" placeholder="Gabriel">
                </div>
                
                <button type="submit" class="btn btn-primary">ok</button>
                
            </form><br><br>
        <%
            if(request.getParameter("id") == null){
                sessao.setAttribute("msg", "<div class='bg-warning'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Você precisa selecionar um colaborador.</h4></div><br>");
        %>
                <script language= "JavaScript">
                    location.href="listColaborador.jsp";
                </script>
            <%
            }else{
                if(request.getParameter("data") != null){

                    String data = request.getParameter("data");

                    DateFormat df = new SimpleDateFormat ("dd/MM/yyyy");
                    df.setLenient (false); // aqui o pulo do gato
                    try {
                        df.parse (data);
                        // data válida
                        %>
                       <p>Bom</p> 
                        <%
                    } catch (ParseException ex) {
                       // data inválida
                       %>
                       <%=ex.toString()%>
                       <p>Merda</p> 
                        <%
                    }
                }
            }
        %>
            <div class="container">
                
            </div>
        </div>
<c:import url="footer.jsp"></c:import>

