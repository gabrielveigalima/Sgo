<%-- 
    Document   : ponto
    Created on : 20/08/2018, 11:01:39
    Author     : gabriel.lima
--%>

<%@page import="model.Ponto"%>
<%@page import="model.CentroCusto"%>
<%@page import="model.Colaborador"%>
<%@page import="controller.CtrlColaborador"%>
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
 <%
            Colaborador c = new Colaborador();
            CentroCusto cc = new CentroCusto();
            Ponto p = new Ponto();
            
            if(request.getParameter("cc") == null){ // verifica de o usuario está lançando ponto para o colaborador            
            cc.setId(request.getParameter("cc"));
            c.setId(request.getParameter("id"));
            p.setDate(request.getParameter("mes"));
            p.setHoraInicio(request.getParameter("hInicio"));
            p.setHoraFim(request.getParameter("hFim"));
            }
            if(request.getParameter("id") == null){//Verificar se está vindo o id do colaborador pela url
                sessao.setAttribute("msg", "<div class='bg-warning'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Você precisa selecionar um colaborador.</h4></div><br>");
            %>
                <script language= "JavaScript">
                    location.href="listColaborador.jsp";
                </script>
            <%
            }else{
                CtrlColaborador crtrlColaborador = new CtrlColaborador();
                
                c.setId(request.getParameter("id"));
                ResultSet cli = crtrlColaborador.selectId(c);

                if(cli.next()){
                    %>
                    <script>
                        var nome = '<%= cli.getString("nome") %>'
                        var cc = '<%= cli.getString("centroCusto") %>'
                        var id = '<%= cli.getString("id") %>'
                    </script>
                    <%
                }
            }
        %>
        <title>Gerar ponto - Operacional - SGO</title>
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
            <div class="container jumbotron">
                <h4 class="text-center">Gerar ponto para <script> document.write(nome); </script></h4>
                <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#gerarPonto">Gerar Ponto</button>                
            </div>
            <div id="gerarPonto" class="modal fade" role="dialog">	
                <div class="modal-dialog">	
                  <!-- Modal content-->	
                  <div class="modal-content">	
                    <div class="modal-header">	
                      <button type="button" class="close" data-dismiss="modal">&times;</button>	
                      <h4 class="modal-title">Gerar ponto para <script> document.write(nome); </script> ?</h4>	
                    </div>	
                    <form method="post"  action='ponto.jsp?id=<%=request.getParameter("id")%>' >
                        <input type="hidden" value="<script> document.write(cc); </script>" name="cc">
                        <div class="modal-body">
                            <div class="form-group">
                                <div class="form-group has-error">
                                    <label class="control-label" for="inputWarning1">Mês *</label>
                                    <select name="mes" class="form-control" id="inputWarning1" required="">
                                        <option>Escolha o mês</option>
                                        <option value="01">Janeiro</option>
                                        <option value="02">Fevereiro</option>
                                        <option value="03">Março</option>
                                        <option value="04">Abril</option>
                                        <option value="05">Maio</option>
                                        <option value="06">Junho</option>
                                        <option value="07">Julho</option>
                                        <option value="08">Agosto</option>
                                        <option value="09">Setembro</option>
                                        <option value="10">Outubro</option>
                                        <option value="11">Novembro</option>
                                        <option value="12">Dezembro</option>
                                    </select>
                                </div>
                                <label class="control-label">Equipamento</label>
                                <select class="form-control">
                                    <option>Escolha o equipamento</option>
                                    <% 
                                    CtrlEquipamento ctrlEquipamento = new CtrlEquipamento();
                                    ResultSet equi = ctrlEquipamento.selecionarEquipamnetoAtivo();
                                    if(equi.next()){
                                        %>
                                            <option value="<%= equi.getString("idEquipamneto") %>"><%= equi.getString("nome") %></option>
                                        <%
                                         while(equi.next()){
                                            %>
                                            <option value="<%= equi.getString("idEquipamneto") %>"><%= equi.getString("nome") %></option>
                                            <%
                                         }
                                    }else{
                                        %>
                                        <option>Não tem centro de custo</option>
                                        <%
                                    }
                                    %>
                                </select>
                                <label class="control-label">Hora de início</label>
                                <input required="" name="hInicio" type="time" placeholder="Digite a hora de início"  class="form-control">
                                <label class="control-label">Hora de fim</label>
                                <input name="hFim" type="time" placeholder="Digite a hora de fim"  class="form-control">
                            </div>
                        </div>
                        <div class="modal-footer ">	
                            <button type="button" class="btn btn-default" data-dismiss="modal">Não</button>
                            <button type="submit" class="btn btn-success" >Sim</button>
                        </div>
                    </form>
                  </div>	
                </div>	
            </div>
       
            <div class="container">
                <%
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
                %>
                
            </div>
        </div>
<c:import url="footer.jsp"></c:import>

