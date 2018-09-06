<%-- 
    Document   : index
    Created on : 29/05/2018, 11:39:07
    Author     : gabriel.lima
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Pagina de login">
    <meta name="author" content="gabriel.lima">
    <link rel="icon" href="img/icon.png">
    <title>Login - SGO</title>
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="/docs/3.3/../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <script src="/docs/3.3/../assets/js/ie-emulation-modes-warning.js"></script>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  </head>

  <body>      
    <div class="container">
        <h2 class="form-signin-heading text-center">Sistema de Gestão Operacional</h2>
        <h1>
        <c:if test="${not empty sessionScope.msg}">
            ${sessionScope.msg}
            <%
                HttpSession sessao = request.getSession();
                sessao.setAttribute("msg", null);
            %>
        </c:if>
        </h1>
        <form action="valida.jsp" method="post" class="form-signin">
          <img class="img-responsive center-block" src="img/logo_bsm.png">
          <input type="hidden" value="login" name="action">
          <h3 class="form-signin-heading text-center">Login </h3>
          <label for="inputEmail" class="sr-only">Email</label>
          <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Digite seu email..." required autofocus>
          <label for="inputPassword" class="sr-only">Senha</label>
          <input type="password" name="pws" id="inputPassword" class="form-control" placeholder="Digite sua senha..." required>
          <button class="btn btn-lg btn-primary btn-block" type="submit">Entrar <samp class="glyphicon glyphicon-log-in"></samp></button>
        </form>
    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/docs/3.3/../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
  