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
		<link rel="icon" href="resources/imgs/Logo2.png" type="image/icon">
		
		<title>Virtual Condo</title>
		
		<!-- Custom fonts for this template-->
		<link href="../vendor/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
		
		<!-- Page level plugin CSS-->
		<link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
		<!-- Custom styles for this template-->
		<link href="../resources/css/sb-admin.css" rel="stylesheet">
	</head>
	<body id="page-top">

	 <c:import url="../utils/morador/header.jsp"></c:import>

  	<div id="wrapper">

    	<c:import url="../utils/morador/sider.jsp"></c:import>
	
	    <div id="content-wrapper">
	
	      <div class="container-fluid">
	
	        <!-- Breadcrumbs-->
	        <ol class="breadcrumb">
	          <li class="breadcrumb-item">
	            <a href="index">Morador</a>
	          </li>
	          <li class="breadcrumb-item active">Moradores</li>
	        </ol>
	
	        <!-- Page Content -->
	        <h1>Moradores Cadastrados</h1>
	          
	        <!-- DataTables Example -->
	        <div class="card mb-3">
	          <div class="card-header">
	            <i class="fas fa-table"></i>
	            Todos os moradores cadastrados</div>
	          <div class="card-body">
	              
	            <div class="table-responsive">
	              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                <thead>
	                  <tr>
	                    <th>Nome</th>
	                    <th>Apartamento</th>
	                    <th>N�mero interfone</th>
	                    <th>Op��o</th>
	                  </tr>
	                </thead>
	                <tfoot>
	                  <tr>
	                    <th>Nome</th>
	                    <th>Apartamento</th>
	                    <th>N�mero interfone</th>
	                    <th>Op��o</th>
	                  </tr>
	                </tfoot>
	                <tbody>
	                  <tr>
	                    <td>Gabriel de Oliveira</td>
	                    <td>1001</td>
	                    <td>3450-1001</td>
	                    <th>
	                        <b><a href="#"><i class="fas fa-envelope"></i> Enviar mensagem</a></b>
	                    </th>
	                  </tr>
	                    <tr>
	                    <td>Matheus de Oliveira</td>
	                    <td>1002</td>
	                    <td>3450-1002</td>
	                    <th>
	                        <b><a href="#"><i class="fas fa-envelope"></i> Enviar mensagem</a></b>
	                    </th>
	                  </tr>
	                    <tr>
	                    <td>Silvio Suguino</td>
	                    <td>1003</td>
	                    <td>3450-1003</td>
	                    <th>
	                        <b><a href="#"><i class="fas fa-envelope"></i> Enviar mensagem</a></b>
	                    </th>
	                  </tr>
	                    <tr>
	                    <td>Exemplo</td>
	                    <td>1004</td>
	                    <td>3450-1004</td>
	                    <th>
	                        <b><a href="#"><i class="fas fa-envelope"></i> Enviar mensagem</a></b>
	                    </th>
	                  </tr>
	                </tbody>
	              </table>
	            </div>
	          </div>
	          <div class="card-footer small text-muted">Ultima atualiza��o dia 30/04</div>
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
	  <script src="../vendor/jquery/jquery.js"></script>
	  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	  <!-- Core plugin JavaScript-->
	  <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
	
	  <!-- Custom scripts for all pages-->
	  <script src="../resources/js/sb-admin.min.js"></script>
	
	</body>
</html>