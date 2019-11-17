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
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="index">Morador</a>
          </li>
          <li class="breadcrumb-item active">Mensagens</li>
        </ol>

        <!-- Page Content -->
        <div class="mb-3">
            <div class="card text-white bg-dark o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-envelope"></i>
                </div>
                <div class="mr-5">Você possui 7 mensagens!</div>
              </div>
              <p class="card-footer text-white clearfix small z-1" href="">
                <span class="float-left">Suas mensagens</span>
              </p>
            </div>
          </div>
        <hr>
          
          <div>
            <a class="text-light btn btn-dark mb-3" href="mensagem?acao=enviar">Enviar uma Mensagem</a>
          </div>
          
        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Caixa de entrada</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>Assunto</th>
                    <th>Remetente</th>
                    <th>Opções</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>Assunto</th>
                    <th>Remetente</th>
                    <th>Opções</th>
                  </tr>
                </tfoot>
                <tbody>
                  <tr>
                    <td>Queria lhe desejar um bom dia</td>
                    <td>Matheus Lopes</td>
                    <td>
                        <a href="mensagem?acao=visualizar"><i class="fas fa-envelope-open-text" style="padding-right: 10px;"> Visualizar</i></a>
                        <a href="#"><i class="fas fa-trash"> Remover</i></a>
                    </td>
                  </tr>
                  <tr>
                    <td>Reunião marcada para as 15:00</td>
                    <td>Silvio Suguino</td>
                    <td>
                        <a href="mensagem-visualizar.html"><i class="fas fa-envelope-open-text" style="padding-right: 10px;"> Visualizar</i></a>
                        <a href="#"><i class="fas fa-trash"> Remover</i></a>
                    </td>
                  </tr>
                  <tr>
                    <td>Bem vindo</td>
                    <td>Gabriel Lopes</td>
                    <td>
                        <a href="mensagem-visualizar.html"><i class="fas fa-envelope-open-text" style="padding-right: 10px;"> Visualizar</i></a>
                        <a href="#"><i class="fas fa-trash"> Remover</i></a>
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
  <script src="./vendor/jquery/jquery.js"></script>
  <script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="./vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="./resources/js/sb-admin.min.js"></script>

</body>
</html>