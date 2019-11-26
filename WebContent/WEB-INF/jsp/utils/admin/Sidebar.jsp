<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!-- Sidebar -->
<ul class="sidebar navbar-nav">
  <li class="nav-item active">
    <a class="nav-link" href="index">
      <i class="fas fa-user"></i>
      <span>${Usuario.nome}</span>
    </a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="moradores">
      <i class="fas fa-home"></i>
      <span>Moradores</span>
    </a>
  </li>
    <li class="nav-item">
    <a class="nav-link" href="visitantes">
      <i class="fas fa-user-friends"></i>
      <span>Visitantes</span>
    </a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="veiculo?acao=listar">
      <i class="fas fa-fw fa-car"></i>
      <span>Veículos</span></a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="area-de-lazer">
      <i class="fas fa-dumbbell"></i>
      <span>Áreas de lazer</span></a>
  </li>
</ul>