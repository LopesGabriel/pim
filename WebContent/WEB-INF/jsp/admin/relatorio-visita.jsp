<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	  <link rel="icon" href="../resources/imgs/Logo2.png" type="image/icon">
	
	<title>Virtual Condo</title>
	
	<!-- Custom fonts for this template-->
	<link href="../vendor/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
	
	<!-- Page level plugin CSS-->
	<link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
	
	<!-- Custom styles for this template-->
	<link href="../resources/css/sb-admin.css" rel="stylesheet">
</head>
<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-blue static-top">

    <a class="navbar-brand mr-1" href="index.html">Virtual Condo</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Buscar por..." aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn btn-primary" type="button">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-bell fa-fw"></i>
          <span class="badge badge-danger">9+</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
          <h6 class="dropdown-header">Notificações</h6>
          <a class="dropdown-item" href="notificacao-lista.html">Suas notificações</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="enviar-notificacao.html">Enviar notificação</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-envelope fa-fw"></i>
          <span class="badge badge-danger">7</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
          <h6 class="dropdown-header">Mensagens</h6>
          <a class="dropdown-item" href="mensagem-lista.html">Suas mensagens</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="enviar-mensagem.html">Enviar mensagem</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-sign-out-alt"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          <a class="dropdown-item" href="#">Opções</a>
          <a class="dropdown-item" href="#">Log de atividades</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Sair</a>
        </div>
      </li>
    </ul>

  </nav>

  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="index-admin.html">
          <i class="fas fa-user"></i>
          <span>Gabriel Lopes</span>
        </a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link" href="../pages/moradores-lista.html">
          <i class="fas fa-home"></i>
          <span>Moradores</span>
        </a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="fas fa-briefcase"></i>
          <span>Colaborador</span>
        </a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="visitante-lista.html">
          <i class="fas fa-user-friends"></i>
          <span>Visitantes</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="veiculo-lista.html">
          <i class="fas fa-fw fa-car"></i>
          <span>Veículos</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="arealazer-lista.html">
          <i class="fas fa-dumbbell"></i>
          <span>Áreas de lazer</span></a>
      </li>
    </ul>

    <div id="content-wrapper">

      <div class="container-fluid">
            <!-- Breadcrumbs-->
            <div class="col">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item">
                    <a href="index.html">Painel de Controle</a>
                  </li>
                  <li class="breadcrumb-item active">Relatório de visita</li>
                </ol>

                <!-- Page Content -->
                <form>
                    <div class="form-label-group mb-3">
                        <input type="text" id="inputNome" class="form-control" placeholder="Nome" required autofocus>
                        <label for="inputNome">Destino</label>
                    </div> 
                    <div class="mb-3 row">
                        <span class="col-1"></span>
                      <label for="inputDataEntrada" class="col-5 col-form-label">Data de Entrada:</label>
                      <input class="form-control col-5" type="date" id="inputDataEntrada">
                        <span class="col-1"></span>
                    </div>
                    <div class="mb-3 row">
                        <span class="col-1"></span>
                      <label for="inputHoraEntrada" class="col-5 col-form-label">Hora de Entrada:</label>
                      <input class="form-control col-5" type="time" id="inputHoraEntrada">
                        <span class="col-1"></span>
                    </div>
                    <div class="mb-3 row">
                        <span class="col-1"></span>
                      <label for="inputDataSaida" class="col-5 col-form-label">Data de Saída:</label>
                      <input class="form-control col-5" type="date" id="inputDataSaida">
                        <span class="col-1"></span>
                    </div>
                    <div class="mb-3 row">
                        <span class="col-1"></span>
                      <label for="inputHoraSaida" class="col-5 col-form-label">Hora de Saída:</label>
                      <input class="form-control col-5" type="time" id="inputHoraSaida">
                        <span class="col-1"></span>
                    </div>
                    <div class="form-lavel-group mb-3 col-12 row">
                        <input type="button" id="inputSubmit" class="btn btn-primary form-control col-4" value="Confirmar">
                        <span class="col-4"></span>
                        <input type="button" id="inputCancelar" class="btn btn-danger form-control col-4" value="Cancelar">
                    </div>
              </form>
            </div><!-- Col dos campos de texto -->
              
      </div><!-- fim do container -->
    </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Virtual Condo 2019</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.content-wrapper -->
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Deseja mesmo sair?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Selecione a opção "Sair" para confirmar o termino da sessão.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
          <a class="btn btn-primary" href="login.html">Sair</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="../vendor/jquery/jquery.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../resources/js/sb-admin.min.js"></script>

</body>
</html>