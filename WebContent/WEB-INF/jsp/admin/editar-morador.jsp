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
                  <li class="breadcrumb-item active">Editar morador</li>
                </ol>

				<c:if test="${msg != null}">
					<h2 class="text-center text-success">${msg}</h2>
				</c:if>

                <!-- Page Content -->
                <form method="post" action="/virtualcondo/moradores?acao=acao">
                	<input type="hidden" name="uId" value="${user.id}">
                    <div class="form-label-group mb-3">
                        <input type="text" name="nome" class="form-control" placeholder="Nome" value="${user.nome}" required autofocus>
                        <label for="inputNome">Nome</label>
                    </div> 
                    <div class="form-label-group mb-3">
                        <input type="text" name="cpf" class="form-control cpf" placeholder="CPF" value="${user.cpf}">
                        <label for="inputCpf">CPF</label>
                    </div>
                    <div class="form-label-group mb-3">
                        <input type="text" name="rg" class="form-control rg" placeholder="RG" value="${user.rg}">
                        <label for="inputRg">RG</label>
                    </div>
                    <div class="form-label-group mb-3">
                        <input type="text" name="email" class="form-control" placeholder="E-mail" value="${user.email}">
                        <label for="inputEmail">E-mail</label>
                    </div>
                    <div class="form-label-group mb-3">
                        <input type="password" name="senha" class="form-control" placeholder="Senha" value="${user.senha}" readonly>
                        <label for="inputSenha">Senha</label>
                    </div>
                    <div class="input-group mb-3">
                        <select class="custom-select" name="tpMorador" id="inputBloco">
                        	<optgroup label="Tipo de Usuário">
	                            <option <c:if test="${user.tipoUsu.id == 1}">selected</c:if> value="1">Morador</option>
	                            <option <c:if test="${user.tipoUsu.id == 2}">selected</c:if> value="2">Administrador</option>
                            </optgroup>
                        </select>
                    </div>
                   	  <div class="form-lavel-group mb-3 col-sm-12 col-lg-4 mx-auto">
				          <input type="submit" class="btn btn-primary form-control col-sm-12 col-lg-5" value="Confirmar">
				          <a href="/virtualcondo/login" class="btn btn-danger col-sm-12 col-lg-5">Voltar</a>
			          </div>
              </form>
            </div><!-- Col dos campos de texto -->
              
        </div><!-- fim do row -->
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
  <script src="./vendor/jquery/jquery.mask.js"></script>
  <script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="./vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="./resources/js/sb-admin.min.js"></script>

<script>
$(document).ready(function(){
	$('.cpf').mask('000.000.000-00');
	$('.rg').mask('0.000.000');
});
</script>

</body>
</html>