<%-- 
    Document   : navbar
    Created on : 06/06/2018, 10:04:55
    Author     : gabriel.lima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Colaborador <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="cadColaborador.jsp"><span class="
glyphicon glyphicon-plus-sign"></span> Cadastro Colaborador</a></li>
              <li><a href="listColaborador.jsp"><span class="
glyphicon glyphicon-list"></span> Listar Colaborador</a></li>
            </ul>
          </li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Centro de custo <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="cadCentroCusto.jsp"><span class="
glyphicon glyphicon-plus-sign"></span> Cadastro Centro de custo</a></li>
              <li><a href="listCentroCusto.jsp"><span class="
glyphicon glyphicon-list"></span> Listar Centro de custo</a></li>
            </ul>
          </li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Equipamento <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="cadEquipamento.jsp"><span class="
glyphicon glyphicon-plus-sign"></span> Cadastro Equipamento</a></li>
              <li><a href="listEquipamento.jsp"><span class="
glyphicon glyphicon-list"></span> Listar Equipamento</a></li>
            </ul>
          </li>
        </ul>
        <ul class='nav navbar-nav navbar-right'>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">OLÁ, <c:if test="${not empty sessionScope.user}">
                ${sessionScope.user}
            </c:if> <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="sair.jsp">Sair</a></li>
                </ul>
            </li>
        </ul>
      </div><!--/.nav-collapse -->
    </div>
</nav>
<br><br><br>