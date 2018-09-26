<%-- 
    Document   : verPonto
    Created on : 05/09/2018, 11:01:46
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

    if(request.getParameter("id") == null && request.getParameter("nome") == null){//Verificar se está vindo o id do colaborador pela url
        sessao.setAttribute("msg", "<div class='bg-warning'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Você precisa selecionar o ponto.</h4></div><br>");
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
                var nome = '<%= request.getParameter("nome")%>';
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
                <h4 class="text-center">Ponto de: <%= request.getParameter("nome")%></h4>
                
            </div>
            <div class="container">
                <div class="table-responsive" id="getPdf">
                    <table class="table">
                        <tr>
                            <th>Centro de Custo</th>
                            <th>Equipamento</th>
                            <th>Data</th>
                            <th>Início</th>
                            <th>Fim</th>
                            <th>Hora Extra Início</th>
                            <th>Hora Extra Fim</th>
                        </tr>
                        
                <%
                 ResultSet rs = ctrlPonto.listarHoras(request.getParameter("id"));
                 while(rs.next()){
                %>
                <tr>
                    <td><%=rs.getString("id_centro_custo")%></td>
                    <td><%=rs.getString("id_equipamento")%></td>
                    <td><%=rs.getString("date")%></td>
                    <td><%=rs.getString("hora_inicio").replace(".0000000","")%></td>
                    <td><%=rs.getString("hora_fim").replace(".0000000","")%></td>
                    <td><%=rs.getString("hora_extra_incio")%></td>
                    <td><%=rs.getString("hora_extra_fim")%></td>                    
                </tr>
                
                <%
                }
                %>
                        
                    </table>
                </div>
            </div>
        </div>
        <div id="testdiv" style="display:none">
            <div>TEST</div>
            <div id="hidediv">TEST2</div>
        </div>
        <center>    
            <a href="javascript:genPDF()"  class="btn btn-danger">Gerar PDF <span class="glyphicon glyphicon-file"></span></a>
        </center>
        <script language= "JavaScript">
            function genPDF() {
                var doc = new jsPDF();
                var specialElementHandlers = {
                    '#hidediv' : function(element,render) {return true;}
                };

                doc.fromHTML($('#getPdf').get(0), 20,5,{
                             'width':500,
                                    'elementHandlers': specialElementHandlers
                });

                    doc.save('<%= request.getParameter("nome")%>_Ponto.pdf');
            }
            function gerarPdf(){
                var doc = new jsPDF();
                doc.fromHTML($('#getPdf').get(0), 20,20,{
                'width':500});
                doc.save(nome+'.pdf')
            }
        </script>
        <script src="../js/jspdf.min.js"></script>

<c:import url="footer.jsp"></c:import>