<%-- 
    Document   : cadCentroCusto
    Created on : 28/06/2018, 09:22:14
    Author     : gabriel.lima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="seguranca.jsp"></c:import>
<c:import url="head.jsp"></c:import>
<title>Cadastro de Centro de custo - SGO</title>
  </head>
  <body>
<c:import url="navbar.jsp"></c:import>  
    <div class="container">
        <h1>
            <c:if test="${not empty sessionScope.msg}">
                ${sessionScope.msg}
            </c:if>
        </h1>
        <form method="post" action="sql.jsp">
            <input type="hidden" name="action" value='cadCentroCusto'>
            <div class="container">
                <div class="col-md-8">
                    <label >Nome</label>
                    <input type="text" name="nome" class="form-control" placeholder="Digite o nome do equipamento">
                </div>
                <div class="col-md-4">
                    <label>Intinere (Horas de transporte)</label>
                    <input type="text" name="intinere" class="form-control" placeholder="Digite o nome do equipamento">
                </div>
                <br>
                <div class="col-md-12">
                    <button type="submit" class="btn btn-success">Cadastrar</button>
                </div>
            </div>
        </form>
    </div>
<c:import url="footer.jsp"></c:import>

