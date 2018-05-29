<%-- 
    Document   : esqueceu-senha
    Created on : 29/05/2018, 11:41:59
    Author     : gabriel.lima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Pagina de login">
    <meta name="author" content="gabriel.lima">
    <link rel="icon" href="img/icon.png">

    <title>Esqueceu a senha - SGO</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="/docs/3.3/../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="/docs/3.3/../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/docs/3.3/../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="container">
        <h2 class="form-signin-heading text-center">Sistema de Gestão Operacional</h2>
        <form class="form-signin">

          <img class="img-responsive center-block" src="img/logo_bsm.png">
          <h3 class="form-signin-heading text-center">Esqueceu a senha </h3>
          <label for="inputEmail" class="sr-only">Email</label>
          <input type="email" id="inputEmail" class="form-control" placeholder="Digite seu email..." required autofocus>
          
          <button class="btn btn-lg btn-primary btn-block" type="submit">Entrar <samp class="glyphicon glyphicon-log-in"></samp></button>
          
        </form>
        <a class="btn btn-primary" href="index.jsp"><samp class="glyphicon glyphicon-arrow-left" ></samp> Voltar</a>
    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/docs/3.3/../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>