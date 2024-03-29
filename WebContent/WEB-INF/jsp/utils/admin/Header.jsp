<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<nav class="navbar navbar-expand navbar-dark bg-blue static-top">

  <a class="navbar-brand mr-1" href="index">Virtual Condo</a>

  <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle">
    <i class="fas fa-bars"></i>
  </button>

  <!-- Span para jogar conteúdo a direita -->
  <span class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0"></span>
  
  <!-- Navbar -->
  <ul class="navbar-nav ml-auto ml-md-0">
    <li class="nav-item dropdown no-arrow mx-1">
      <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <i class="fas fa-envelope fa-fw"></i>
      </a>
      <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
        <h6 class="dropdown-header">Mensagens</h6>
        <a class="dropdown-item" href="mensagem">Minhas mensagens</a>
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="mensagem?acao=enviar">Enviar mensagem</a>
      </div>
    </li>
    <li class="nav-item dropdown no-arrow">
      <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <i class="fas fa-sign-out-alt"></i>
      </a>
      <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
        <a class="dropdown-item" href="perfil">Perfil</a>
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Sair</a>
      </div>
    </li>
  </ul>

</nav>