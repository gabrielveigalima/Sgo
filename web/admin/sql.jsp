<%-- 
    Document   : sql
    Created on : 06/06/2018, 11:09:14
    Author     : gabriel.lima
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.AdminDAO"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
//Inicia a Sessão
HttpSession sessao = request.getSession();
//Pega a ação que será realizada 
String action = request.getParameter("action");
String msg = "";
AdminDAO dao = new  AdminDAO();
User c = new User();  
String name,email,nivel,pws,nomeC;

//Verifica se a ação é para logar usuário
if(action.equals("select")){
    //Pega os dados do formulário 
    if(!request.getParameter("email").equals("")){
        email = request.getParameter("email");
        c.setEmail(email);
    }else if(!request.getParameter("name").equals("")){
        name = request.getParameter("name");
        c.setName(name);
    }else if(!request.getParameter("nivel").equals("")){
        nivel = request.getParameter("nivel");
        c.setNivel(nivel);
    }  
    //Verifca se cadastrou 
    User u = dao.selectFiltro(c);
    if(u != null){
        msg = u.toString();
        msg = "<div class='bg-success'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Login realizado com sucesso.</h4></div><br>";
        session.setAttribute("user", u.getName());
        session.setAttribute("id", u.getIdUser());
        session.setAttribute("nivel", u.getNivel());
        if(u.getNivel().toString().equals("1")){//Verifica se o nivel é de admin
            %>
                <c:redirect url="admin/index.jsp"></c:redirect>
            <% 
        }else if(u.getNivel().toString().equals("2")){
            %>
                <c:redirect url="job/index.jsp"></c:redirect>
            <%
        }                            
    }else{
        msg = "<div class='bg-danger'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Erro ao logar usuário.</h4></div><br>"; 
        %>
            <c:redirect url="index.jsp"></c:redirect>
        <% 
    }
   //Cria a sessão da mensagem 
    sessao.setAttribute("msg", msg);
     //Redireciona a página 

}else if(action.equals("cad")){
    name = request.getParameter("nome");
    email = request.getParameter("email");
    nivel = request.getParameter("nivel");
    pws = request.getParameter("pws");
    nomeC = request.getParameter("nomeC");
    
        //Verifa se alguns dos campos estão fazios 
        if(name.equals("") || email.equals("") || pws.equals("") || nivel.equals("") || nomeC.equals("")){
            msg = "<div class='bg-success'><h4 class'text-center'>Preencha todos os campos</h4></div>";
        }else{
             //Instacia a classe e seta os objetos 
            
            c.setName(name);
            c.setEmail(email);
            c.setPassword(pws);
            c.setNivel(nivel);
            c.setNomeCompleto(nomeC);
            //Verifca se cadastrou 
            if(dao.cadastroUser(c)){
                     msg = "<div class='bg-success'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Cadastro realizado com sucesso.</h4></div><br>";
                }else{
                    msg = "<div class='bg-danger'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Erro ao cadastrar usuário.</h4></div><br>"; 
                }
        }
        
   //Cria a sessão da mensagem 
    sessao.setAttribute("msg", msg);

        
}