<%-- 
    Document   : listColaborador
    Created on : 16/07/2018, 09:05:26
    Author     : gabriel.lima
--%>

<%@page import="controller.CtrlUser"%>
<%@page import="model.User"%>
<%@page import="model.CentroCusto"%>
<%@page import="java.text.Normalizer"%>
<%@page import="controller.CtrlColaborador"%>
<%@page import="model.Colaborador"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="controller.CtrlCentroCusto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        HttpSession sessao = request.getSession();
                        sessao.setAttribute("msg", null);
                    %>
                </c:if>
            </h1>
            <form method="post" action='listCentroCusto.jsp' class="form-inline jumbotron">
                <input type="hidden" value="selectFiltro" name="action">
                <div class="form-group">
                    <label for="exampleInputName2">Nome</label>
                    <input name="name" type="text" class="form-control center-block" id="exampleInputName2" placeholder="Gabriel">
                </div>
                
                <button type="submit" class="btn btn-primary">Filtrar</button>
                <a href='listCentroCusto.jsp' class="btn btn-success">Sem Filtrar</a>
            </form><br><br>
            <div class="table-responsive">
                <table class="table">
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Criação</th>
                        <th>Mais</th>
                        <th>Editar</th>                     
                    </tr>
                        <%
                    CtrlCentroCusto ctrl = new CtrlCentroCusto();
                    ResultSet rst = ctrl.selecionarCentroCustoAtivo();
                       

                    ResultSet rs = null;
                    CentroCusto cc = new CentroCusto();
                    if(request.getParameter("action")!= null){
                        String action = request.getParameter("action");
                        
                        //Pega os dados do formulário 
                        if(request.getParameter("name")!= null){
                            if(!request.getParameter("name").equals("")){
                                String name = Normalizer.normalize(request.getParameter("name"), 
                            Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "").
                            replaceAll(" ", "").toUpperCase();
                            cc.setName(name);
                            }
                        }
                        rs = ctrl.selectFiltro(cc);
                        
                    }else{
                        rs = ctrl.selecionarCentroCustoAtivo();
                    }
                    while(rs.next()){
                    %>
                        <tr>
                            <td><%=rs.getString("id")%></td>
                            <td><%=rs.getString("nome")%></td>
                            <td><%=rs.getString("dateCreate").replaceAll("-","/")%></td>
                            
                            <td><button type="button" data-toggle="modal" data-target="#view<%=rs.getString("id")%>" class="btn btn-small btn-primary"><spam class="glyphicon glyphicon-eye-open"></spam></button></td>
                            <td><button type="button" data-toggle="modal" data-target="#edit<%=rs.getString("id")%>" class="btn btn-small btn-warning"><spam class="glyphicon glyphicon-pencil"></spam></button></td>                        
                        </tr>
                        <!-- Modal -->
                        <div id="edit<%=rs.getString("id")%>" class="modal fade" role="dialog">
                          <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title"><%=rs.getString("nome")%></h4>
                              </div>
                              <div class="modal-body">
                                  <form method="post" action="sql.jsp">
                                    <input type="hidden" name="action" value='editCentroCusto'>
                                    <input type="hidden" name="id" value='<%=rs.getString("id")%>'>
                                    
                                    <div class="form-group">
                                      <label>Nome:</label>
                                      <input name="nomeC" type="text" class="form-control" placeholder="Centro de Custo" value="<%=rs.getString("nome")%>">
                                      <label>Intinere:</label>
                                      <input name="intinere" type="text" class="form-control" placeholder="Intinere:" value="<%
                                    //if(rs.getString("intinere") != null){
                                        
                                    //} %>">
                                    </div>
                                    <button type="submit" class="btn btn-success">Salvar</button>
                                  </form>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                              </div>
                            </div>
                          </div>
                        </div>
                    
                        <div id="view<%=rs.getString("id")%>" class="modal fade" role="dialog">
                          <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title"><%=rs.getString("nome")%></h4>
                              </div>
                              <div class="modal-body">
                                <p>Nome: <%=rs.getString("nome")%></p>
                                <p>Criação: <%=rs.getString("dateCreate").replaceAll("-","/")%></p>
                                <p>Intinere: <%
                                    //if(rs.getString("intinere") != null){
                                        %><%=rs.getString("intinere")%><%    
                                    //}else{
                                        %>Não tem intinere<%
                                   // }
}
                                %>
                                </p>
                                <p>Criador: 
                                <%
                                User u = new User();
                                u.setIdUser(rs.getString("userCreate"));
                                ResultSet rsu = new CtrlUser().selecionarFiltro(u);
                                if(rsu.next()){ %>
                                    <%=rsu.getString("email")%>
                                <%
                                }
                                %>
                                </p>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                              </div>
                            </div>
                          </div>
                        </div>
                        <%
                        }
                        %>
                </table>
            </div>
        </div>
<c:import url="footer.jsp"></c:import>

