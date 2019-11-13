<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	    <link rel="icon" href="./resources/imgs/Logo2.png" type="image/icon">
	
	    <title>Virtual Condo - Morador</title>
	
	    <!-- Custom fonts for this template-->
	    <link href="./vendor/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
	
	    <!-- Page level plugin CSS-->
	    <link href="./vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
	
	    <!-- Custom styles for this template-->
	    <link href="./resources/css/sb-admin.css" rel="stylesheet">
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
	        <input type="text" class="form-control" placeholder="Busque por..." aria-label="Search" aria-describedby="basic-addon2">
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
	            <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="notificacao-lista.html">Minhas notificações</a>
	        </div>
	      </li>
	      <li class="nav-item dropdown no-arrow mx-1">
	        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          <i class="fas fa-envelope fa-fw"></i>
	          <span class="badge badge-danger">7</span>
	        </a>
	        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
	          <h6 class="dropdown-header">Mensagens</h6>
	          <a class="dropdown-item" href="mensagem-lista.html">Minhas mensagens</a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="enviar-mensagem.html">Enviar mensagem</a>
	        </div>
	      </li>
	      <li class="nav-item dropdown no-arrow">
	        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          <i class="fas fa-sign-out-alt"></i>
	        </a>
	        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
	          <a class="dropdown-item" href="perfil-morador.html">Perfil</a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Sair</a>
	        </div>
	      </li>
	    </ul>
	
	  </nav>
	
	  <div id="wrapper">
	
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
	
	    <div id="content-wrapper">
	
	      <div class="container-fluid">
	
	        <!-- Breadcrumbs-->
	        <ol class="breadcrumb">
	          <li class="breadcrumb-item">
	            <a href="#">Dashboard</a>
	          </li>
	          <li class="breadcrumb-item active">Bem-Vindo ${Usuario.nome}!</li>
	        </ol>
	
	        <!-- Icon Cards-->
	        <div class="row">
	          <div class="col-xl-3 col-sm-6 mb-3">
	            <div class="card text-white bg-primary o-hidden h-100">
	              <div class="card-body">
	                <div class="card-body-icon">
	                  <i class="fas fa-fw fa-comments"></i>
	                </div>
	                <div class="mr-5">Moradores</div>
	              </div>
	              <a class="card-footer text-white clearfix small z-1" href="moradores-lista.html">
	                <span class="float-left">Visualizar moradores</span>
	                <span class="float-right">
	                  <i class="fas fa-angle-right"></i>
	                </span>
	              </a>
	            </div>
	          </div>
	          <div class="col-xl-3 col-sm-6 mb-3">
	            <div class="card text-white bg-warning o-hidden h-100">
	              <div class="card-body">
	                <div class="card-body-icon">
	                  <i class="fas fa-fw fa-list"></i>
	                </div>
	                <div class="mr-5">Advertências</div>
	              </div>
	              <a class="card-footer text-white clearfix small z-1" href="notificacao-lista.html">
	                <span class="float-left">Visualizar detalhes</span>
	                <span class="float-right">
	                  <i class="fas fa-angle-right"></i>
	                </span>
	              </a>
	            </div>
	          </div>
	          <div class="col-xl-3 col-sm-6 mb-3">
	            <div class="card text-white bg-success o-hidden h-100">
	              <div class="card-body">
	                <div class="card-body-icon">
	                  <i class="fas fa-fw fa-shopping-cart"></i>
	                </div>
	                <div class="mr-5">Reuniões</div>
	              </div>
	              <a class="card-footer text-white clearfix small z-1" href="reuniao-lista.html">
	                <span class="float-left">Visualizar detalhes</span>
	                <span class="float-right">
	                  <i class="fas fa-angle-right"></i>
	                </span>
	              </a>
	            </div>
	          </div>
	          <div class="col-xl-3 col-sm-6 mb-3">
	            <div class="card text-white bg-danger o-hidden h-100">
	              <div class="card-body">
	                <div class="card-body-icon">
	                  <i class="fas fa-fw fa-life-ring"></i>
	                </div>
	                <div class="mr-5">Porteiro</div>
	              </div>
	              <a class="card-footer text-white clearfix small z-1" href="enviar-mensagem.html">
	                <span class="float-left">Falar com o porteiro</span>
	                <span class="float-right">
	                  <i class="fas fa-angle-right"></i>
	                </span>
	              </a>
	            </div>
	          </div>
	        </div>
	
	        <!-- DataTables Example -->
	        <div class="card mb-3">
	          <div class="card-header">
	            <i class="fas fa-table"></i>
	            Minhas visitas</div>
	          <div class="card-body">
	            <div class="table-responsive">
	              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                <thead>
	                  <tr>
	                    <th>Nome</th>
	                    <th>Dia da entrada</th>
	                    <th>Hora de entrada</th>
	                    <th>Hora de saida</th>
	                    <th>Id do visitante</th>
	                  </tr>
	                </thead>
	                <tfoot>
	                  <tr>
	                    <th>Nome</th>
	                    <th>Dia da entrada</th>
	                    <th>Hora de entrada</th>
	                    <th>Hora de saida</th>
	                    <th>Id do visitante</th>
	                  </tr>
	                </tfoot>
	                <tbody>
	                  <tr>
	                    <td>Tiger Nixon</td>
	                    <td>2011/04/25</td>
	                    <td>12:30</td>
	                    <td>13:20</td>
	                    <td>58</td>
	                  </tr>
	                  <tr>
	                    <td>Garrett Winters</td>
	                    <td>2011/04/27</td>
	                    <td>10:21</td>
	                    <td>14:00</td>
	                    <td>204</td>
	                  </tr>
	                  <tr>
	                    <td>Ashton Cox</td>
	                    <td>2011/05/02</td>
	                    <td>15:30</td>
	                    <td>15:55</td>
	                    <td>12</td>
	                  </tr>
	                  <tr>
	                    <td>Cedric Kelly</td>
	                    <td>2011/05/02</td>
	                    <td>14:25</td>
	                    <td>15:55</td>
	                    <td>152</td>
	                  </tr>
	                  <tr>
	                    <td>Airi Satou</td>
	                    <td>2011/05/02</td>
	                    <td>14:25</td>
	                    <td>15:55</td>
	                    <td>153</td>
	                  </tr>
	                </tbody>
	              </table>
	            </div>
	          </div>
	          <div class="card-footer small text-muted">Atualizado hoje às 12:00</div>
	        </div>
	
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
	
	  </div>
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
	          <a class="btn btn-danger" href="login.html">Sair</a>
	        </div>
	      </div>
	    </div>
	  </div>
	
	  <!-- Bootstrap core JavaScript-->
	  <script src="./vendor/jquery/jquery.js"></script>
	  <script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	  <!-- Core plugin JavaScript-->
	  <script src="./vendor/jquery-easing/jquery.easing.min.js"></script>
	
	  <!-- Page level plugin JavaScript-->
	  <script src="./vendor/chart.js/Chart.min.js"></script>
	  <script src="./vendor/datatables/jquery.dataTables.js"></script>
	  <script src="./vendor/datatables/dataTables.bootstrap4.js"></script>
	
	  <!-- Custom scripts for all pages-->
	  <script src="./resources/js/sb-admin.js"></script>
	
	  <!-- Demo scripts for this page-->
	  <script src="./resources/js/demo/datatables-demo.js"></script>
	  <script src="./resources/js/demo/chart-area-demo.js"></script>
	
	</body>
</html>