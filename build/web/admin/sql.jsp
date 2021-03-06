<%-- 
    Document   : sql
    Created on : 06/06/2018, 11:09:14
    Author     : gabriel.lima
--%>

<%@page import="controller.CtrlUser"%>
<%@page import="DAO.UserDAO"%>
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

CtrlUser ctrl = new CtrlUser();
User c = new User();  
String name,email,nivel,pws,nomeC,status,id,redefinir;

if(action.equals("edit")){
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
        msg = ctrl.editarUser(c);
    }

//Cria a sessão da mensagem 
sessao.setAttribute("msg", msg);
%>
    <c:redirect url="user.jsp"></c:redirect>
<%
}else if(action.equals("cad")){
    name = Normalizer.normalize(request.getParameter("nome"), 
        Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "").
        replaceAll(" ", "").toUpperCase();
    email = Normalizer.normalize(request.getParameter("email"), 
        Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "").
        toLowerCase();
    nivel = Normalizer.normalize(request.getParameter("nivel"), 
        Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "");
    nomeC = Normalizer.normalize(request.getParameter("nomeC"), 
        Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "").toUpperCase();
    
    
        //Verifa se alguns dos campos estão fazios 
        if(name.equals("") || email.equals("") || nivel.equals("") || nomeC.equals("")){
            msg = "<div class='bg-danger'><h4 class'text-center'>Preencha todos os campos</h4></div>";
        }else{

            //Instacia a classe e seta os objetos             
            c.setName(name);
            c.setEmail(email);
            c.setNivel(nivel);
            c.setNomeCompleto(nomeC);
            String idUser = sessao.getAttribute("id").toString();
            //Verifca se cadastrou 
            
            msg = ctrl.cadastrarUser(c,idUser);
        }
        
   //Cria a sessão da mensagem 
    sessao.setAttribute("msg", msg);
    %>
        <c:redirect url="cadUser.jsp"></c:redirect>
    <%  
}
%>