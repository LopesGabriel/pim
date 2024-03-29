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
	
	  <c:import url="../utils/morador/header.jsp"></c:import>
	
	  <div id="wrapper">
	
	    <c:import url="../utils/morador/sider.jsp"></c:import>
	
	    <div id="content-wrapper">
	
	      <div class="container-fluid">
	
	        <!-- Breadcrumbs-->
	        <ol class="breadcrumb">
	          <li class="breadcrumb-item active">Bem-Vindo ${Usuario.nome}!</li>
	        </ol>
	
	        <!-- Icon Cards-->
          <div class="mb-3">
            <div class="card text-white bg-primary o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-life-ring"></i>
                </div>
                <div class="mr-5">Meu Perfil</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="perfil">
                <span class="float-left">Visitar Perfil</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
	
	        <!-- DataTables Example -->
	        <div class="card mb-3">
	          <div class="card-header">
	            <i class="fas fa-table"></i>
	            Minhas visitas</div>
	          <div class="card-body">
	            <div class="table-responsive">
	              <table class="table table-bordered" id="dataTable">
	                <thead>
	                  <tr>
	                    <th>Visitante</th>
	                    <th>Data e hora de chegada</th>
	                    <th>Data e hora de saida</th>
	                  </tr>
	                </thead>
	                <tfoot>
	                  <tr>
	                    <th>Visitante</th>
	                    <th>Data e hora de chegada</th>
	                    <th>Data e hora de saida</th>
	                  </tr>
	                </tfoot>
	                <tbody>
	                <c:forEach items="${visitas}" var="visita">
	                  <tr>
	                    <td>${visita.visitante.nome}</td> 
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
	          <div class="card-footer small text-muted">Atualizado hoje �s 12:00</div>
	        </div>
	
	      </div>
	      <!-- /.container-fluid -->
	
	      <!-- Sticky Footer -->
	      <footer class="sticky-footer">
	        <div class="container my-auto">
	          <div class="copyright text-center my-auto">
	            <span>Copyright � Virtual Condo 2019</span>
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
	  <script src="./vendor/datatables/dataTables.bootstrap4.js"></script>
	
	  <!-- Custom scripts for all pages-->
	  <script src="./resources/js/sb-admin.js"></script>
	
	  <!-- Demo scripts for this page-->
	  <script src="./resources/js/demo/datatables-demo.js"></script>
	  <script src="./resources/js/demo/chart-area-demo.js"></script>
	
	</body>
</html>