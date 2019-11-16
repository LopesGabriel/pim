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
	<link rel="icon" href="./resources/imgs/Logo2.png" type="image/icon">
	
	<title>Virtual Condo - Administrador</title>
	
	<!-- Custom fonts for this template-->
	<link href="./vendor/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
	
	<!-- Page level plugin CSS-->
	<link href="./vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
	
	<!-- Custom styles for this template-->
	<link href="./resources/css/sb-admin.css" rel="stylesheet">
</head>
<body id="page-top">

  <!-- Header -->
  <c:import url="../utils/admin/Header.jsp"></c:import>

  <div id="wrapper">

    <!-- Side Bar -->
    <c:import url="../utils/admin/Sidebar.jsp"></c:import>

    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">Painel</a>
          </li>
          <li class="breadcrumb-item active">Visão geral</li>
        </ol>

        <!-- Icon Cards-->
        <div class="row">
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-primary o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-users"></i>
                </div>
                <div class="mr-5"><c:out value="${adminPage.moradoresCadastrados}"></c:out> moradores cadastrados!</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="/virtualcondo/moradores">
                <span class="float-left">Administrar moradores</span>
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
                  <i class="fas fa-briefcase"></i>
                </div>
                <div class="mr-5"><c:out value="${adminPage.colaboradoresCadastrados}"></c:out> colaboradores cadastrados!</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="colaborador-lista.html">
                <span class="float-left">Administrar colaboradores</span>
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
                  <i class="fas fa-user-friends"></i>
                </div>
                <div class="mr-5"><c:out value="${adminPage.visitantesCadastrados}"></c:out> visitantes cadastrados!</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="visitante-lista.html">
                <span class="float-left">Administrar visitantes</span>
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
                  <i class="fas fa-car"></i>
                </div>
                <div class="mr-5"><c:out value="${adminPage.veiculosCadastrados}"></c:out> veículos cadastrados!</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="veiculo-lista.html">
                <span class="float-left">Administrar veículos</span>
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
            Registro de entrada</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>Visitante</th>
                    <th>Responsável</th>
                    <th>Data e Hora de entrada</th>
                    <th>Data e Hora de saida</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>Visitante</th>
                    <th>Responsável</th>
                    <th>Data e Hora de entrada</th>
                    <th>Data e Hora de saida</th>
                  </tr>
                </tfoot>
                <tbody>
                	<c:forEach items="${adminPage.visitas}" var="visita">                	
		                <tr>
			                <td>${visita.visitante.nome}</td>
			                <td>${visita.responsavel.nome}</td>
			                <td>
			                	<fmt:formatDate value="${visita.dtEntrada}" pattern="dd/MM/yyyy HH:mm"/>
			                </td>
			                <td>
			                	<fmt:formatDate value="${visita.dtSaida}" pattern="dd/MM/yyyy HH:mm"/>
			                </td>
		                </tr>
                	</c:forEach>
                </tbody>
              </table>
            </div>
          </div>
          <div class="card-footer small text-muted">Ultima atualização dia 30/04</div>
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
  <c:import url="../auxiliar/logout.jsp"></c:import>

  <!-- Bootstrap core JavaScript-->
  <script src="./vendor/jquery/jquery.js"></script>
  <script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="./vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="./vendor/chart.js/Chart.min.js"></script>
  <script src="./vendor/datatables/jquery.dataTables.js"></script>
  <script src="./vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="./resources/js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="./resources/js/demo/datatables-demo.js"></script>
  <script src="./resources/js/demo/chart-area-demo.js"></script>

</body>
</html>