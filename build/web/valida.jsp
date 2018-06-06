<%-- 
    Document   : valida
    Created on : 05/06/2018, 08:44:14
    Author     : gabriel.lima
--%>

<%@page import="model.User"%>
<%@page import="DAO.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
//Inicia a Sessão
            HttpSession sessao = request.getSession();
            //Pega a ação que será realizada 
            String action = request.getParameter("action");
            String msg = "";
            UserDAO dao = new  UserDAO();
            
            
            //Verifica se a ação é para logar usuário
            if(action.equals("login")){
                //Pega os dados do formulário 
                String email = request.getParameter("email");
                String senha1 = request.getParameter("pws");
               
                    //Instacia a classe e seta os objetos 
                    User c = new User();                    
                    c.setEmail(email);
                    c.setPassword(senha1);
                    //Verifca se cadastrou 
                    User u = dao.login(c);
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
                
            }
            
            /*/Verifica se a ação é para cadastrar usuário
            if(action.equals("cad")){
                //Pega os dados do formulário 
                String nome = request.getParameter("nome");
                String email = request.getParameter("email");
                String senha1 = request.getParameter("pws1");
                String senha2 = request.getParameter("pws2");
                //Verifcica se as senhas são iguais
                if(senha1.equals(senha2)){
                    //Verifa se alguns dos campos estão fazios 
                    if(nome == null || email == null || senha1 == null){
                    msg = "<div class='bg-success'><h4 class'text-center'>Preencha todos os campos</h4></div>";
                }else{
                     //Instacia a classe e seta os objetos 
                    Usuario c = new Usuario();
                    c.setNome(nome);
                    c.setEmail(email);
                    c.setSenha(senha1);
                    //Verifca se cadastrou 
                    if(dao.cadastroCli(c)){
                             msg = "<div class='bg-success'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Cadastro realizado com sucesso.</h4></div><br>";
                        }else{
                            msg = "<div class='bg-danger'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Erro ao cadastrar usuário.</h4></div><br>"; 
                        }
                }
                    } else{
                    msg = "<div class='bg-danger'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Senhas não combinam.</h4></div><br>"; 
                }
               //Cria a sessão da mensagem 
                sessao.setAttribute("msg", msg);
            }
            */














%>
    






