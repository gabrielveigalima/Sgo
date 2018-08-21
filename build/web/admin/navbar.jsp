<%-- 
    Document   : navbar
    Created on : 06/06/2018, 10:04:55
    Author     : gabriel.lima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>          
      </div>
      <div id="navbar" class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
          <li><a href="index.jsp">Home</a></li>
          <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Usuario <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="cadUser.jsp">Cadastrar</a></li>
            <li><a href="user.jsp">Manipular</a></li>
          </ul>
        </li>
        </ul>
        <ul class='nav navbar-nav navbar-right'>
            <li><a href="sair.jsp">Sair</a></li>
        </ul>
      </div><!--/.nav-collapse -->
    </div>
</nav>
<br><br><br>