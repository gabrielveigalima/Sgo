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

        <title>Listar Colaborador - Operacional - SGO</title>
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
            <form method="post" action='listColaborador.jsp' class="form-inline jumbotron">
                <input type="hidden" value="selectFiltro" name="action">
                <div class="form-group">
                    <label for="exampleInputName2">Nome</label>
                    <input name="name" type="text" class="form-control" id="exampleInputName2" placeholder="Gabriel">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail2">Matrícula</label>
                  <input name="matricula" type="number" class="form-control" id="exampleInputEmail2" placeholder="">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail2">Centro de Custo</label>
                    <select name='cCusto' class="form-control">
                        <option value="">Sem Filtro</option>
                        <%
                         CtrlCentroCusto crtlCC = new CtrlCentroCusto();
                         ResultSet rst = crtlCC.selecionarCentroCustoAtivo();
                         if(rst.next()){
                            %>
                                <option value="<%= rst.getString("id") %>"><%= rst.getString("nome") %></option>
                            <%
                             while(rst.next()){
                                 %>
                                 <option value="<%= rst.getString("id") %>"><%= rst.getString("nome") %></option>
                                 
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
                <button type="submit" class="btn btn-primary">Filtrar</button>
                <a href='listColaborador.jsp' class="btn btn-success">Sem Filtrar</a>
            </form><br><br>
            <div class="table-responsive">
                <table class="table">
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Matrícula</th>
                        <th>Status</th>
                        <th>Mais</th>
                        <th>Editar</th>
                        <th>Excluir</th>
                    </tr>
                    
                    
                        <%
                            
                    ResultSet rs = null;
                    CtrlColaborador   ctrl = new  CtrlColaborador();
                    CentroCusto cc = new CentroCusto();
                    if(request.getParameter("action")!= null){
                        String action = request.getParameter("action");
                        Colaborador cola = new Colaborador();  
                        
                        //Pega os dados do formulário 
                        if(request.getParameter("name")!= null){
                            if(!request.getParameter("name").equals("")){
                                String name = Normalizer.normalize(request.getParameter("name"), 
                            Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "").
                            replaceAll(" ", "").toUpperCase();
                                System.out.println("TESTE: "+name);
                            cola.setNome(name);
                            }
                        }
                        if(request.getParameter("matricula")!= null){
                            if(!request.getParameter("matricula").equals("")){
                                cola.setMatricula(request.getParameter("matricula"));
                            }
                        } 
                        if( request.getParameter("cCusto")!= null){
                            if(!request.getParameter("cCusto").equals("")){
                                String cCusto = request.getParameter("cCusto");
                                cc.setId(cCusto);
                            }
                        }
                        rs = ctrl.selectFiltro(cola,cc);
                        
                    }else{
                        rs = ctrl.listar();
                    }
                    while(rs.next()){
                    %>
                        <tr>
                            <td><%=rs.getString("id")%></td>
                            <td><%=rs.getString("nome")%></td>
                            <td><%=rs.getString("matricula")%></td>
                            <td>
                                <%
                                if(rs.getString("ativo").equals("1")){
                                    %>
                                    Ativo
                                    <%
                                }else{
                                    %>
                                    Desativado
                                    <%
                                }
                                %>
                            </td>
                            <td><button type="button" data-toggle="modal" data-target="#view<%=rs.getString("id")%>" class="btn btn-small btn-primary"><spam class="glyphicon glyphicon-eye-open"></spam></button></td>
                            <td><button type="button" data-toggle="modal" data-target="#edit<%=rs.getString("id")%>" class="btn btn-small btn-warning"><spam class="glyphicon glyphicon-pencil"></spam></button></td>                        
                            <td><button type="button" data-toggle="modal" data-target="#excluir<%=rs.getString("id")%>" class="btn btn-small btn-danger"><spam class="glyphicon glyphicon-remove"></spam></button></td>
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
                                    <input type="hidden" name="action" value='editColaborador'>
                                    <input type="hidden" name="id" value='<%=rs.getString("id")%>'>
                                    
                                    <div class="form-group">
                                      <label>Nome:</label>
                                      <input name="nomeU" type="text" class="form-control" placeholder="Nome Completo" value="<%=rs.getString("nome")%>">
                                      <label>Matrícula</label>
                                      <input name="matricula" type="text" class="form-control" placeholder="Nome Completo" value="<%=rs.getString("matricula")%>">
                                      <label>Centro de Custo</label>
                                      <select name="cc" class="form-control">
                                        <%
                                            String idCCEdit = rs.getString("centroCusto");
                                            ResultSet rsCCEdit = crtlCC.selecionarCentroCustoId(idCCEdit);
                                            if(rsCCEdit.next()){
                                               %>
                                                   
                                                   <option value="<%= rsCCEdit.getString("id") %>"><%= rsCCEdit.getString("nome") %></option>
                                               <%
                                            }else{
                                                %>
                                                <option>Não tem centro de custo</option>
                                                <%
                                            }
                                            rst = crtlCC.selecionarCentroCustoAtivo();
                                            if(rst.next()){
                                               %>
                                                   <option value="<%= rst.getString("id") %>"><%= rst.getString("nome") %></option>
                                               <%
                                                while(rst.next()){
                                                    %>
                                                    <option value="<%= rst.getString("id") %>"><%= rst.getString("nome") %></option>

                                                    <%
                                                }
                                            }else{
                                                %>
                                                <option>Não tem centro de custo</option>
                                                <%
                                            }
                                        %> 
                                      </select>
                                      <label>Início no Centro de Custo</label>
                                      <input name="dateInicioCentroCusto" type="date" class="form-control" placeholder="Nome Completo" value="<%=rs.getString("dateInicioCentroCusto")%>">
                                      
                                      <label>Status do usuário</label>  
                                      <select name="status" class="form-control">
                                        <% if(rs.getString("ativo").equals("0")){
                                            %>
                                            <option value="0" >Desativado</option>
                                            <%
                                        }else if(rs.getString("ativo").equals("1")){
                                            %>
                                            <option value="1" >Ativo</option>
                                            <%
                                        }   
                                            %>
                                        <option value="1" >Ativo</option>
                                        <option value="0" >Desativado</option>
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
                                <p>Matrícula <%=rs.getString("matricula")%></p>
                                <p>Status: <% if(rs.getString("ativo").equals("0")){
                                    %>
                                    Inativo
                                    <%
                                }else if(rs.getString("ativo").equals("1")){
                                    %>
                                    Ativo
                                    <%
                                }   
                                    %>
                                    </p>
                                    <p>Criação: <%=rs.getString("dateCreate").replaceAll("-","/")%></p>
                                    <p>Centro de Custo:
                                    <% 
                                        String idCC = rs.getString("centroCusto");
                                        ResultSet rsCC = crtlCC.selecionarCentroCustoId(idCC);
                                        if(rsCC.next()){
                                           %>
                                               <%= rsCC.getString("nome") %>
                                           <%
                                        }else{
                                            %>
                                            <option>Não tem centro de custo</option>
                                            <%
                                        }
                                       %> 
                                    </p>
                                    <p>Início no Centro de Custo <%=rs.getString("dateInicioCentroCusto").replaceAll("-","/")%></p>
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
                        <div id="excluir<%=rs.getString("id")%>" class="modal fade" role="dialog">	
                          <div class="modal-dialog">	
                            <!-- Modal content-->	
                            <div class="modal-content">	
                              <div class="modal-header">	
                                <button type="button" class="close" data-dismiss="modal">&times;</button>	
                                <h4 class="modal-title">Dejesa excluir <%=rs.getString("nome")%> ?</h4>	
                              </div>	
                              	
                              <div class="modal-footer">	
                                	
                                  <form method="post" action="sql.jsp">	
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Não</button>	
                                    <input type="hidden" name="id" value='<%=rs.getString("id")%>'>	
                                    <input type="hidden" name="action" value='excluirColaborador'>	
                                    <button type="submit" class="btn btn-danger" >Sim</button>	
                                 </form>	
                                	
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

