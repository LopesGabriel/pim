<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

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

    <!-- Sidebar -->
    <c:import url="../utils/admin/Sidebar.jsp"></c:import>

    <div id="content-wrapper">

      <div class="container-fluid">

            <!-- Breadcrumbs-->
            <div class="col">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item">
                    <a href="/virtualcondo/index">Painel de Controle</a>
                  </li>
                  <li class="breadcrumb-item active">Adicionar uma visita</li>
                </ol>

                <!-- Page Content -->
                <form class="form-row" method="post" action="visita">
                    <div class="form-group col-sm-12 col-lg-6">
                    	<label for="visitante">Visitante</label>
                        <select class="custom-select" name="visitante" id="visitante">
                            <optgroup label="Visitantes Cadastrados">
                            	<c:forEach items="${visitantes}" var="visitante">
                            		<option value="${visitante.id}">${visitante.nome}</option>
                            	</c:forEach>
                            </optgroup>
                        </select>
                    </div>
                    <div class="form-group col-sm-12 col-lg-6">
                    	<label for="responsavel">Responsável</label>
                    	<select class="custom-select" name="morador" id="morador">
                    		<optgroup label="Moradores">
                    			<c:forEach items="${moradores}" var="morador">
	                    			<option value="${morador.id}">${morador.nome}</option>
                    			</c:forEach>
                    		</optgroup>
                    	</select>
                    </div>
                    <div class="form-group col-sm-12">
                    	<input type="submit" class="btn btn-primary col-sm-5" value="Confirmar">
                    	<a href="index" class="btn btn-danger col-sm-5 float-right">Voltar</a>
                    </div>
              </form>
            </div><!-- Col dos campos de texto -->

      </div><!-- fim do container -->
      <div class="container">
      	<c:if test="${msg != null}">
      		<div class="alert alert-secondary text-center" role="alert">
      			${msg}
      		</div>
      	</c:if>
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