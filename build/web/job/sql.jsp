<%-- 
    Document   : sql
    Created on : 06/06/2018, 11:09:14
    Author     : gabriel.lima
--%>

<%@page import="controller.CtrlColaborador"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="model.Colaborador"%>
<%@page import="java.util.Date"%>
<%@page import="model.CentroCusto"%>
<%@page import="controller.CtrlCentroCusto"%>
<%@page import="controller.CtrlEquipamento"%>
<%@page import="DAO.UserDAO"%>
<%@page import="model.Equipamento"%>
<%@page import="java.text.Normalizer"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
//Inicia a Sessão
HttpSession sessao = request.getSession();
//Pega a ação que será realizada 
String action = request.getParameter("action");
String msg = "";
//Usuario
UserDAO dao = new  UserDAO();
User c = new User();

//Equipamento
Equipamento e = new Equipamento();
CtrlEquipamento ctrlEquipamento = new CtrlEquipamento();
CtrlCentroCusto crtlcentrocusto = new CtrlCentroCusto();
CentroCusto cen = new CentroCusto();
Colaborador colaborador = new Colaborador();
CtrlColaborador crtlcolaborador = new CtrlColaborador();

String name,email,nivel,pws,nomeC,status,id,redefinir;

String idUser = sessao.getAttribute("id").toString();

if(action.equals("cadColaborador")){
    name = Normalizer.normalize(request.getParameter("nome"), 
        Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "").
        replaceAll(" ", "").toUpperCase();
    String matricula = request.getParameter("matricula");
    String cCusto = request.getParameter("cCusto");
    
    colaborador.setNome(name);
    colaborador.setMatricula(matricula);
    colaborador.setDataInicioCentroCusto(request.getParameter("data"));
    cen.setId(cCusto);
    
    msg = crtlcolaborador.cadastrarColaborador(colaborador, cen, idUser);
    sessao.setAttribute("msg", msg);

    %>
        <c:redirect url="cadColaborador.jsp"></c:redirect>
    <%
    
} else if(action.equals("cadCentroCusto")){
    name = Normalizer.normalize(request.getParameter("nome"), 
        Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "").
        replaceAll(" ", "").toUpperCase();
    String intinere = Normalizer.normalize(request.getParameter("intinere"), 
        Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "").
        replaceAll(" ", "").toUpperCase();
    cen.setName(name);
    cen.setIntinere(intinere);
    msg = crtlcentrocusto.cadastrarCentroCusto(cen, idUser);
    sessao.setAttribute("msg", msg);

    %>
        <c:redirect url="cadCentroCusto.jsp"></c:redirect>
    <%
    
} else if(action.equals("cadEquipamento")){
    name = Normalizer.normalize(request.getParameter("nome"), 
        Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "").
        replaceAll(" ", "").toUpperCase();
    e.setName(name);
    msg = ctrlEquipamento.cadastrarEquipamneto(e,idUser);
    sessao.setAttribute("msg", msg);

    %>
        <c:redirect url="cadEquipamento.jsp"></c:redirect>
    <%
    
} else if(action.equals("edit")){
    name = Normalizer.normalize(request.getParameter("nome"), 
        Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "").
        replaceAll(" ", "").toUpperCase();
    email = Normalizer.normalize(request.getParameter("email"), 
        Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "").
        toLowerCase();
    status = Normalizer.normalize(request.getParameter("status"), 
        Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "");
    nivel = Normalizer.normalize(request.getParameter("nivel"), 
        Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "");
    nomeC = Normalizer.normalize(request.getParameter("nomeC"), 
        Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "").toUpperCase();
    id = Normalizer.normalize(request.getParameter("id"), 
        Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "").
        replaceAll(" ", "");
    if(request.getParameter("redefinir") != null){
        redefinir = request.getParameter("redefinir");
    
        c.setPassword(redefinir);
    }
    if(name.equals("") || status.equals("") || email.equals("") || id.equals("") || nivel.equals("") || nomeC.equals("")){
        msg = "<div class='bg-danger'><h4 class'text-center'>Preencha todos os campos</h4></div>";
    }else{
         //Instacia a classe e seta os objetos    
        c.setIdUser(id);
        c.setName(name);
        c.setEmail(email);
        c.setNivel(nivel);
        c.setStatus(status);   
        c.setNomeCompleto(nomeC);
        
        //Verifca se cadastrou 
        msg = dao.editUser(c);
    }

//Cria a sessão da mensagem 
sessao.setAttribute("msg", msg);
%>
    <c:redirect url="user.jsp"></c:redirect>
<%
}
%>