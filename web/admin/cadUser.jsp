<%-- 
    Document   : cadUser
    Created on : 06/06/2018, 13:14:33
    Author     : gabriel.lima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="head.jsp"></c:import>
        <title>Cadastrar Usuário - admin - SGO</title>
    </head>
    <body>
        <c:import url="navbar.jsp"></c:import> 
        <div class="container">
            <h1>
                <c:if test="${not empty sessionScope.msg}">
                    ${sessionScope.msg}
                </c:if>
            </h1>
            <form method="post" action="sql.jsp">
                <div class='bg-danger'>
                    <h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>
                        NÃO PODE USAR ACENTO!
                    </h4>
                </div><br>
                <h1 class='text-center'>Cadastro de Usuário</h1> 
                <input type="hidden" name="action" value='cad'>
                <div class="form-group">
                  <label for="InputNome">1° Nome</label>
                  <input type="text" required="" name='nome' class="form-control" id="InputNome" placeholder="1° Nome">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Endereço de e-mail</label>
                    <input required name='email' type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
                </div>
                <div class="form-group">
                    <label for="SelectNivel">Nível</label>
                    <select id='SelectNivel' name='nivel' class="form-control">
                        <option value="2">Colaborador</option>
                      <option value="1">Administrador</option>                      
                    </select>
                </div>
                <div class="form-group">
                  <label for="InputSenha">Senha</label>
                  <input name="pws" required type="password" class="form-control" id="InputSenha" placeholder="Senha">
                </div>
                <div class="form-group">
                  <label for="InputNomeC">Nome completo</label>
                  <input name="nomeC" required type="text" class="form-control" id="InputNomeC" placeholder="Nome completo">
                </div>

                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>
<c:import url="footer.jsp"></c:import>