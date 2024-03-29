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
	
	<title>Virtual Condo</title>
	
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

          <div class="row"> 
            <!-- Breadcrumbs-->
            <div class="col">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item">
                    <a href="index">Síndico</a>
                  </li>
                  <li class="breadcrumb-item active">Cadastro de visitante</li>
                </ol>

                <!-- Page Content -->
                <form class="form-row" method="post" action="/virtualcondo/visitantes">
                    <div class="form-label-group mb-3 col-sm-12 col-lg-6">
                        <input type="text" id="nome" name="nome" class="form-control" placeholder="Nome" required autofocus>
                        <label for="nome">Nome</label>
                    </div> 
                    <div class="form-label-group mb-3 col-sm-12 col-lg-6">
                        <input type="text" id="cpf" name="cpf" class="form-control" placeholder="CPF">
                        <label for="cpf">CPF</label>
                    </div>
                    <div class="form-label-group mb-3 col-sm-12 col-lg-6">
                        <input type="text" id="rg" name="rg" class="form-control" placeholder="RG">
                        <label for="rg">RG</label>
                    </div>
                    <div class="form-label-group mb-3 col-sm-12 col-lg-6">
                        <input type="text" id="telefone" name="telefone" class="form-control" placeholder="Telefone">
                        <label for="telefone">Telefone</label>
                    </div>
			          <div class="col-12">
				          <div class="col-sm-12 col-lg-12">
				          	 <input type="submit" class="btn btn-primary form-control col-4" value="Confirmar">
				          	 <a href="/virtualcondo/visitantes" class="btn btn-danger col-4 float-right">Voltar</a>
				          </div>
			          </div>
              </form>
            </div>
              
        </div><!-- fim do row -->
      </div><!-- fim do container -->
      <c:if test="${msg != null}">
	      <div class="container">
	      	<div class="alert alert-secondary text-center mt-4" role="alert">
	      		${msg}
	      	</div>
	      </div>
      </c:if>
    </div>

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
  <c:import url="../auxiliar/logout.jsp"></c:import>

  <!-- Bootstrap core JavaScript-->
  <script src="./vendor/jquery/jquery.js"></script>
  <script src="./vendor/jquery/jquery.mask.js"></script>
  <script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="./vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="./resources/js/sb-admin.min.js"></script>

<script>
	$(document).ready(function(){

		$('#cpf').mask('000.000.000-00');
		$('#rg').mask('0.000.000');
		$('#telefone').mask('(00) 0 0000-0000');

	});
</script>

</body>
</html>