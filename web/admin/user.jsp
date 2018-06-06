<%-- 
    Document   : user
    Created on : 06/06/2018, 09:51:47
    Author     : gabriel.lima
--%>

<%@page import="DAO.AdminDAO"%>
<%@page import="model.User"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="head.jsp"></c:import>

        <title>Usuário - admin - SGO</title>
    </head>
    <body>
        <c:import url="navbar.jsp"></c:import>  
        <div class="container">
            <form method="post" class="form-inline">
                <input type="hidden" value="select" name="action">
                <div class="form-group">
                    <label for="exampleInputName2">Nome</label>
                    <input name="name" type="text" class="form-control" id="exampleInputName2" placeholder="Gabriel">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail2">Email</label>
                  <input name="email" type="email" class="form-control" id="exampleInputEmail2" placeholder="gabriel.lima@bsm.com.br">
                </div>
                <div class="form-group">
                    <select name='nivel' class="form-control">
                        <option value="2">Colaborador</option>
                      <option value="1">Administrador</option>                      
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Enviar convite</button>
            </form><br><br>
            <div class="table-responsive">
                <table class="table">
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Nível</th>
                        <th>Email</th>
                        <th>Status</th>
                        
                        <th>Mais</th>
                        <th>Editar</th>
                        <th>Deletar</th>                        
                    </tr>
                    <%
                    AdminDAO dao = new  AdminDAO();
                    User u = new User();
                    ResultSet rs = new AdminDAO().select();
                    while(rs.next()){
                        %>
                    <tr>
                        <td><%=rs.getString("idUser")%></td>
                        <td><%=rs.getString("nome")%></td>
                        <td><%=rs.getString("nivel")%></td>
                        <td><%=rs.getString("email")%></td>
                        <td><%=rs.getString("status")%></td>
                        <td><button type="button" class="btn btn-small btn-primary"><spam class="glyphicon glyphicon-eye-open"></spam></button></td>
                        <td><button type="button" class="btn btn-small btn-warning"><spam class="glyphicon glyphicon-pencil"></spam></button></td>
                        <td><button type="button" class="btn btn-small btn-danger"><spam class="glyphicon glyphicon-remove"></spam></button></td>
                    </tr>
                    <%
                    }
                    %>
                    
                </table>
            </div>
        </div>
        
<c:import url="footer.jsp"></c:import>
