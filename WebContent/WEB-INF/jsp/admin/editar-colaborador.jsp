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
	<link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
	
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

          <div class="row"> 
            <!-- Breadcrumbs-->
            <div class="col">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item">
                    <a href="index">Síndico</a>
                  </li>
                  <li class="breadcrumb-item active">Editar colaborador</li>
                </ol>

                <!-- Page Content -->
                <form>
                    <div class="form-label-group mb-3">
                        <input type="text" id="inputNome" class="form-control" placeholder="Nome" value="Matheus de Oliveira Lopes" required autofocus>
                        <label for="inputNome">Nome</label>
                    </div> 
                    <div class="form-label-group mb-3">
                        <input type="text" id="inputCpf" class="form-control" value="059-099-301-17" placeholder="CPF">
                        <label for="inputCpf">CPF</label>
                    </div>
                    <div class="form-label-group mb-3">
                        <input type="text" id="inputRg" class="form-control" placeholder="RG" value="3.174.547">
                        <label for="inputRg">RG</label>
                    </div>
                    <div class="form-label-group mb-3">
                        <input type="text" id="inputEmail" class="form-control" placeholder="E-mail" value="matlopes1999@gmail.com">
                        <label for="inputEmail">E-mail</label>
                    </div>
                    <div class="form-label-group mb-3">
                        <input type="text" id="inputTelefone" class="form-control" placeholder="Telefone" value="(61) 9 8151-0636">
                        <label for="inputTelefone">Telefone</label>
                    </div>
                    <div class="mb-3 row">
                        <span class="col-1"></span>
                      <label for="inputDate" class="col-5 col-form-label">Data de Nascimento:</label>
                      <input class="form-control col-5" type="date" id="inputDate" value="1999-01-13">
                        <span class="col-1"></span>
                    </div>
                    <div class="form-label-group mb-3">
                        <input type="password" id="inputSenha" class="form-control" placeholder="Senha" value="senha">
                        <label for="inputSenha">Senha</label>
                    </div>
                    <div class="form-label-group mb-3">
                        <input type="password" id="inputConfirmarSenha" class="form-control" placeholder="Confirmar senha" value="senha">
                        <label for="inputConfirmarSenha">Confirmar senha</label>
                    </div>
                    <div class="input-group mb-3">
                        <select class="custom-select" id="inputBloco">
                            <option>Tipo de usuário</option>
                            <option selected>Colaborador</option>
                        </select>
                    </div>
                    <div class="form-label-group mb-3">
                        <input type="text" id="inputSalario" class="form-control" value="R$ 100,00" placeholder="Salário">
                        <label for="inputSalario">Salário</label>
                    </div>
              </form>
            </div><!-- Col dos campos de texto -->
              
            <div id="coluna2" class="col">
                
                <ol class="breadcrumb">
                  <li class="breadcrumb-item active">Imagem de Perfil</li>
                </ol>
                
                <img class="rounded mx-auto d-block mb-3" src="../resources/imgs/Foto_prefil.png" width="300" height="400">
                
                <div class="form-group">
                    <label for="exampleFormControlFile1">Adicionar imagem</label>
                    <input type="file" class="form-control-file" id="exampleFormControlFile1">
                </div>
                
            </div>
              
        </div><!-- fim do row -->
          <div class="form-lavel-group mb-3 col-12 row">
            <input type="button" id="inputSubmit" class="btn btn-primary form-control col-4" value="Confirmar">
            <span class="col-4"></span>
            <input type="button" id="inputCancelar" class="btn btn-danger form-control col-4" value="Cancelar">
          </div>
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
  <script src="../vendor/jquery/jquery.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../resources/js/sb-admin.min.js"></script>

</body>
</html>