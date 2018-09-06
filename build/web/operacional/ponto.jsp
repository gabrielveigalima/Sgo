<%-- 
    Document   : ponto
    Created on : 20/08/2018, 11:01:39
    Author     : gabriel.lima
--%>

<%@page import="java.util.Calendar"%>
<%@page import="controller.CtrlPonto"%>
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

<c:import url="seguranca.jsp"></c:import>
<c:import url="head.jsp"></c:import>
<%
    HttpSession sessao = request.getSession(); 
    String idUser = sessao.getAttribute("id").toString();
    CtrlPonto ctrlPonto = new CtrlPonto(); 
    Colaborador c = new Colaborador();
    CentroCusto cc = new CentroCusto();
    Ponto p = new Ponto();
    String ccc = "";

    if(request.getParameter("cc") != null){ // verifica de o usuario está lançando ponto para o colaborador   
        
        cc.setId(request.getParameter("cc"));
        c.setId(request.getParameter("id"));
        p.setDate(request.getParameter("mes"));
        p.setHoraInicio(request.getParameter("hInicio"));
        p.setHoraFim(request.getParameter("hFim"));

        String msg = ctrlPonto.cadastrarPonto(p, cc, c, idUser);
        
        sessao.setAttribute("msg", msg);

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
        ResultSet cli = crtrlColaborador.selectId(request.getParameter("id"));// Seleciona colaborador pelo id
        if(cli.next()){
           ccc = cli.getString("centroCusto");
            %>
            <script>
                var nome = '<%= cli.getString("nome")%>';
                var id = '<%= cli.getString("id")%>';
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
                <center>
                <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#gerarPonto">Gerar Ponto</button>  
                <button onclick="abreVerPonto()" href="verPonto.jsp?id=" class="btn btn-success">Ver Ponto</button>
                <button onclick="gerarPdf()"  class="btn btn-success">Gerar PDF</button>
                </center>
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
                        <input type="hidden" value="<%= ccc %>" name="cc">
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
              
            </div>
        </div>
        
        <script language= "JavaScript">
            function abreVerPonto(){
                location.href='verPonto.jsp?id='+id;
            }
            function gerarPdf(){
                var doc = new jsPDF()

                doc.text('Hello world!', 10, 10)
                doc.save(nome+'.pdf')
            }
        </script>
        <script src="../js/jspdf.min.js"></script>

<c:import url="footer.jsp"></c:import>

