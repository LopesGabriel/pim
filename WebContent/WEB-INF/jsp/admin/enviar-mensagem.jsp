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
            <!-- Breadcrumbs-->
            <div class="col">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item">
                    <a href="index">Síndico</a>
                  </li>
                  <li class="breadcrumb-item active">Enviar mensagem</li>
                </ol>

                <!-- Page Content -->
                <form action="mensagem" method="POST">
                    <div class="form-label-group mb-3">
                        <input type="text" id="assuntoMensagem" name="assunto" placeholder="Assunto" class="form-control">
                        <label for="assuntoMensagem">Assunto</label>
                    </div>
                    <div class="input-group mb-3">
                        <select class="custom-select" id="inputBloco" name="destinatario">
                            <option selected disabled="disabled">Destinatário</option>
                            <c:forEach items="${moradores}" var="morador">
                            	<option value="${morador.id}">${morador.nome}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-label-group mb-3">
                        <textarea class="form-control" id="textoMensagem" name="mensagem" placeholder="Mensagem"rows="3"></textarea>
                    </div>
                    <div class="form-lavel-group mb-3 col-12 row">
                        <button type="submit" id="inputSubmit" class="btn btn-primary form-control col-4">Enviar</button>
                        <span class="col-4"></span>
                        <a href="mensagem" class="btn btn-danger form-control col-4">Cancelar</a>
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