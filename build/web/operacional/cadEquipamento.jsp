<%-- 
    Document   : cadEquipamento
    Created on : 18/06/2018, 09:23:22
    Author     : gabriel.lima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="seguranca.jsp"></c:import>
<c:import url="head.jsp"></c:import>
<title>Cadastro de Equipamento - SGO</title>
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
            <input type="hidden" name="action" value='cadEquipamento'>
            <div class="form-group">
              <label >Nome do Equipamento</label>
              <input type="text" name="nome" class="form-control" placeholder="Digite o nome do equipamento">
            </div>
            <button type="submit" class="btn btn-success">Cadastrar</button>
        </form>
    </div>
<c:import url="footer.jsp"></c:import>

