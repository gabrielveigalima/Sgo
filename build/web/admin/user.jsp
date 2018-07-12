<%-- 
    Document   : user
    Created on : 06/06/2018, 09:51:47
    Author     : gabriel.lima
--%>

<%@page import="controller.CtrlUser"%>
<%@page import="DAO.UserDAO"%>
<%@page import="java.text.Normalizer"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="model.User"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="seguranca.jsp"></c:import>

<c:import url="head.jsp"></c:import>

        <title>Usuário - admin - SGO</title>
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
            <form method="post" action='user.jsp' class="form-inline">
                <input type="hidden" value="selectFiltro" name="action">
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
                <button type="submit" class="btn btn-primary">Filtrar</button>
                <a href='user.jsp' class="btn btn-success">Sem Filtrar</a>
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
                    </tr>
                    <%
                    ResultSet rs;
                    if(request.getParameter("action") != null){
                        String action = request.getParameter("action");
                        User u = new User();  
                        CtrlUser   ctrl = new  CtrlUser();
                   
                        //if(action.equals("select")){
                        //Pega os dados do formulário 
                        if(!request.getParameter("email").equals("")){
                            String email = Normalizer.normalize(request.getParameter("email"), 
                            Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "").
                            toLowerCase();
                            u.setEmail(email);
                        }else if(!request.getParameter("name").equals("")){
                            String name = Normalizer.normalize(request.getParameter("name"), 
                            Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "").
                            replaceAll(" ", "").toUpperCase();
                            u.setName(name);
                        }else if(!request.getParameter("nivel").equals("")){
                            String nivel = request.getParameter("nivel");
                            u.setNivel(nivel);

                        }
                         rs = ctrl.selecionarFiltro(u);

                        }else{
                            rs = new CtrlUser().selecionar();
                        }
                    
                    while(rs.next()){
                        %>
                    <tr>
                        <td><%=rs.getString("idUser")%></td>
                        <td><%=rs.getString("nome")%></td>
                        <td><% if(rs.getString("nivel").equals("1")){
                                    %>
                                    Admin
                                    <%
                                }else if(rs.getString("nivel").equals("2")){
                                    %>
                                    Colaborador
                                    <%
                                }
                                    
                                    %></td>
                        <td><%=rs.getString("email")%></td>
                        <td><% if(rs.getString("status").equals("0")){
                                    %>
                                    Inativo
                                    <%
                                }else if(rs.getString("status").equals("1")){
                                    %>
                                    Ativo
                                    <%
                                }   
                                    %></td>
                        <td><button type="button" data-toggle="modal" data-target="#view<%=rs.getString("idUser")%>" class="btn btn-small btn-primary"><spam class="glyphicon glyphicon-eye-open"></spam></button></td>
                        <td><button type="button" data-toggle="modal" data-target="#edit<%=rs.getString("idUser")%>" class="btn btn-small btn-warning"><spam class="glyphicon glyphicon-pencil"></spam></button></td>                        

                        <!-- Modal -->
                        <div id="edit<%=rs.getString("idUser")%>" class="modal fade" role="dialog">
                          <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title"><%=rs.getString("nomeCompleto")%></h4>
                              </div>
                              <div class="modal-body">
                                  <form method="post" action="sql.jsp">
                                    <input type="hidden" name="action" value='edit'>
                                    <input type="hidden" name="id" value='<%=rs.getString("idUser")%>'>
                                    <div class="form-group">
                                        <input name="nome" value="<%=rs.getString("nome")%>" type="text" class="form-control" placeholder="Nome">
                                        <select name="nivel" class="form-control">
                                        <% if(rs.getString("nivel").equals("1")){
                                            %>
                                            <option value="1" >Admin</option>
                                            <%
                                        }else if(rs.getString("nivel").equals("2")){
                                            %>
                                            <option value="2" >Colaborador</option>
                                            <%
                                        }   
                                            %>
                                        <option value="1" >Admin</option>
                                        <option value="2" >Colaborador</option>
                                      </select>                                         
                                    </div>
                                    <div class="form-group">
                                      <input name="email" value="<%=rs.getString("email")%>" type="email" class="form-control" placeholder="Email">
                                      
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                          <input name="redefinir" value="1" type="checkbox"> Redefinir senha (123456)
                                        </label>
                                    </div>
                                    <div class="form-group">
                                      <input name="nomeC" type="text" class="form-control" placeholder="Nome Completo" value="<%=rs.getString("nomeCompleto")%>">
                                      <select name="status" class="form-control">
                                        <% if(rs.getString("status").equals("0")){
                                            %>
                                            <option value="0" >Inativo</option>
                                            <%
                                        }else if(rs.getString("status").equals("1")){
                                            %>
                                            <option value="1" >Ativo</option>
                                            <%
                                        }   
                                            %>
                                        
                                        <option value="1" >Ativo</option>
                                        <option value="0" >Inativo</option>
                                        
                                      </select>                                      
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
                    
                        <div id="view<%=rs.getString("idUser")%>" class="modal fade" role="dialog">
                          <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title"><%=rs.getString("nomeCompleto")%></h4>
                              </div>
                              <div class="modal-body">
                                <p>Nome: <%=rs.getString("nome")%></p>
                                <p>Email: <%=rs.getString("email")%></p>
                                <p>Nível: <% if(rs.getString("nivel").equals("1")){
                                    %>
                                    Admin
                                    <%
                                }else if(rs.getString("nivel").equals("2")){
                                    %>
                                    Colaborador
                                    <%
                                }
                                    
                                    %></p>
                                <p>Status: <% if(rs.getString("status").equals("0")){
                                    %>
                                    Inativo
                                    <%
                                }else if(rs.getString("status").equals("1")){
                                    %>
                                    Ativo
                                    <%
                                }   
                                    %>
                                    </p>
                                <p>Criação: <%=rs.getString("dateCreate").replaceAll("-","/")%></p>
                                <p>Último Login: <%
                                    
                                    if(rs.getString("loginLast")== null){
                                    %>
                                    Nunca entrou
                                    <%
                                }else{
                                    %>
                                    <%=rs.getString("loginLast")%>
                                    <%
                                }   
                                
                                %></p>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                              </div>
                            </div>

                          </div>
                        </div>
                    </tr>
                    <%
                    }
                    %>
                    
                </table>
            </div>
        </div>
        
<c:import url="footer.jsp"></c:import>
