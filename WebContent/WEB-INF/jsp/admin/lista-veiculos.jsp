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
	<link href="../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	
	<!-- Custom styles for this template-->
	<link href="../resources/css/sb-admin.css" rel="stylesheet">
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
            <a href="index">Síndico</a>
          </li>
          <li class="breadcrumb-item active">veículos</li>
        </ol>

        <!-- Page Content -->
        <h1>Lista de veículos</h1>
          
        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Veículos registrados</div>
          <div class="card-body">
              
              <button type="button" style="margin-left: 2em; margin-bottom: 1em;" class="btn btn-info"><a style="color: #fff;" href="cadastro-veiculo.html">Cadastrar Veículo</a></button>
              
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>Modelo</th>
                    <th>Vaga</th>
                    <th>Placa</th>
                    <th>Proprietário</th>
                    <th>Opções</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>Modelo</th>
                    <th>Vaga</th>
                    <th>Placa</th>
                    <th>Proprietário</th>
                    <th>Opções</th>
                  </tr>
                </tfoot>
                <tbody>
                  <tr>
                    <td>Ferrari</td>
                    <td>1001</td>
                    <td>GOD-9598</td>
                    <td>Matheus de Oliveira Lopes</td>
                    <td>
                        <a href="#"><i class="fas fa-trash"> Deletar</i></a> |
                        <a href="editar-veiculo.html"><i class="fas fa-edit"> Editar</i></a>
                    </td>
                  </tr>
                    <tr>
                    <td>Fusca</td>
                    <td>1002</td>
                    <td>FEI-1025</td>
                    <td>Gabriel de Oliveira Lopes</td>
                    <td>
                        <a href="#"><i class="fas fa-trash"> Deletar</i></a> |
                        <a href="editar-veiculo.html"><i class="fas fa-edit"> Editar</i></a>
                    </td>
                  </tr>
                    <tr>
                    <td>Brasília</td>
                    <td>1003</td>
                    <td>BRO-5842</td>
                    <td>Silvio Suguino</td>
                    <td>
                        <a href="#"><i class="fas fa-trash"> Deletar</i></a> |
                        <a href="editar-veiculo.html"><i class="fas fa-edit"> Editar</i></a>
                    </td>
                  </tr>
                    <tr>
                    <td>bugatti</td>
                    <td>1004</td>
                    <td>EXM-9598</td>
                    <td>Matheus de Oliveira Lopes</td>
                    <td>
                        <a href="#"><i class="fas fa-trash"> Deletar</i></a> |
                        <a href="editar-veiculo.html"><i class="fas fa-edit"> Editar</i></a>
                    </td>
                  </tr>
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
  <script src="../vendor/jquery/jquery.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../resources/js/sb-admin.min.js"></script>

</body>
</html>