<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
            <div class="col">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item">
                    <a href="index">Morador</a>
                  </li>
                  <li class="breadcrumb-item active">Editar veículo</li>
                </ol>

                <!-- Page Content -->
                <form action="/virtualcondo/veiculo" method="post">
                	<input type="number" value="${veiculo.id}" id="idVeiculo" name="idVeiculo" hidden="true" />
                    <div class="form-label-group mb-3">
                        <input type="text" id="placaVeiculo" class="form-control" name="placa" placeholder="Placa" value="${veiculo.placa}" required>
                        <label for="placaVeiculo">Placa</label>
                    </div>
                    <div class="form-label-group mb-3">
                        <input type="text" id="marcaVeiculo" class="form-control" name="marca" value="${veiculo.marca}" placeholder="Marca">
                        <label for="marcaVeiculo">Marca</label>
                    </div>
                    <div class="input-group mb-3">
                        <select class="custom-select" id="vagaVeiculo" name="vaga">
                            <option selected>${veiculo.vaga.vaga}</option>
                            <c:forEach items="${vagas}" var="v">
                        		<option>${v.vaga}</option>
                        	</c:forEach>
                        </select>
                    </div>
                    <div class="form-lavel-group mb-3 col-12 row">
                        <button type="submit" id="editarVeiculo" class="btn btn-primary form-control col-4">Confirmar</button>
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
  <c:import url="../auxiliar/logout.jsp"></c:import>

  <!-- Bootstrap core JavaScript-->
  <script src="./vendor/jquery/jquery.js"></script>
  <script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="./vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="./resources/js/sb-admin.min.js"></script>

</body>
</html>