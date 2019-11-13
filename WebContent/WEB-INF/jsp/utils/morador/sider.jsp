<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Sidebar -->
<ul class="sidebar navbar-nav">
  <li class="nav-item">
    <a class="nav-link active" href="index-morador.html">
      <i class="fas fa-user"></i>
      <span>${Usuario.nome}</span>
    </a>
  </li>
  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      <i class="fas fa-car"></i>
      <span>Veículos</span>
    </a>
    <div class="dropdown-menu" aria-labelledby="pagesDropdown">
      <h6 class="dropdown-header">Opções de veículos</h6>
      <a class="dropdown-item" href="veiculo-lista.html">Meus veículos</a>
      <a class="dropdown-item" href="cadastrar-veiculo.html">Registrar veículo</a>
    </div>
  </li>
  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      <i class="fas fa-futbol"></i>
      <span>Lazer</span>
    </a>
    <div class="dropdown-menu" aria-labelledby="pagesDropdown">
      <h6 class="dropdown-header">Reservar um espaço</h6>
      <a class="dropdown-item" href="reservar-lazer.html">Reservar espaço</a>
    </div>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="meu-apartamento.html">
      <i class="fas fa-building"></i>
      <span>Meu apartamento</span></a>
  </li>
</ul>