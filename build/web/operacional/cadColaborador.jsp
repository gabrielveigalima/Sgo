<%-- 
    Document   : cadColaborador
    Created on : 02/07/2018, 08:48:28
    Author     : gabriel.lima
--%>

<%@page import="controller.CtrlCentroCusto"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
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
            <input type="hidden" name="action" value='cadColaborador'>
            <div class="container">
                <div class="col-md-8">
                    <label >Nome</label>
                    <input type="text" required="" name="nome" class="form-control" placeholder="Digite o nome do colaborador">
                </div>
                <div class="col-md-4">
                    <label>Matrícula</label>
                    <input required type="number" name="matricula" class="form-control" placeholder="Digite a matrícula do colaborador">
                </div>
                <div class="col-md-8">
                    <label>Centro de Custo</label>
                    <select required class="form-control" name="cCusto">
                        <%
                         CtrlCentroCusto crtl = new CtrlCentroCusto();
                         ResultSet rs = crtl.selecionarCentroCustoAtivo();
                         if(rs.next()){
                            %>
                                <option value="<%= rs.getString("id") %>"><%= rs.getString("nome") %></option>
                            <%
                             while(rs.next()){
                                 %>
                                 <option value="<%= rs.getString("id") %>"><%= rs.getString("nome") %></option>
                                 
                                 <%
                             }
                         }else{
                             %>
                             <option>Não tem centro de custo</option>
                             <%
                         }
                        %>
                      
                    </select>
                </div>
                <div class="col-md-4">
                    <label>Data de quando inicou no Centro de Custo</label>
                    <input required type="date" name="data" class="form-control">
                </div>
                        <br>
                <div class="col-md-12 center-block">
                    <button type="submit" class="btn btn-success">Cadastrar</button>
                </div>
            </div>
        </form>
    </div>
<c:import url="footer.jsp"></c:import>

