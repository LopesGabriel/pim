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
                    <a href="index.html">Painel de Controle</a>
                  </li>
                  <li class="breadcrumb-item active">Cadastro de morador</li>
                </ol>

                <!-- Page Content -->
                <form>
                    <div class="form-label-group mb-3">
                        <input type="text" id="inputNome" class="form-control" placeholder="Nome" required autofocus>
                        <label for="inputNome">Nome</label>
                    </div> 
                    <div class="form-label-group mb-3">
                        <input type="text" id="inputCpf" class="form-control" placeholder="CPF">
                        <label for="inputCpf">CPF</label>
                    </div>
                    <div class="form-label-group mb-3">
                        <input type="text" id="inputRg" class="form-control" placeholder="RG">
                        <label for="inputRg">RG</label>
                    </div>
                    <div class="form-label-group mb-3">
                        <input type="text" id="inputUnidade" class="form-control" placeholder="Unidade">
                        <label for="inputUnidade">Unidade</label>
                    </div>
                    <div class="form-label-group mb-3">
                        <input type="text" id="inputEmail" class="form-control" placeholder="E-mail">
                        <label for="inputEmail">E-mail</label>
                    </div>
                    <div class="form-label-group mb-3">
                        <input type="text" id="inputTelefone" class="form-control" placeholder="Telefone">
                        <label for="inputTelefone">Telefone</label>
                    </div>
                    <div class="form-label-group mb-3">
                        <input type="text" id="inputInterfone" class="form-control" placeholder="Interfone">
                        <label for="inputInterfone">Interfone</label>
                    </div>
                    <div class="mb-3 row">
                        <span class="col-1"></span>
                      <label for="inputDate" class="col-5 col-form-label">Data de Nascimento:</label>
                      <input class="form-control col-5" type="date" id="inputDate">
                        <span class="col-1"></span>
                    </div>
                    <div class="form-label-group mb-3">
                        <input type="password" id="inputSenha" class="form-control" placeholder="Senha">
                        <label for="inputSenha">Senha</label>
                    </div>
                    <div class="form-label-group mb-3">
                        <input type="password" id="inputConfirmarSenha" class="form-control" placeholder="Confirmar senha">
                        <label for="inputConfirmarSenha">Confirmar senha</label>
                    </div>
                    <div class="input-group mb-3">
                        <select class="custom-select" id="inputBloco">
                            <option selected>Tipo de usuário</option>
                            <option>Morador</option>
                            <option>Administrador</option>
                        </select>
                    </div>
                    <div class="input-group mb-3">
                        <select class="custom-select" id="inputBloco">
                            <option selected>Bloco</option>
                            <option>A</option>
                            <option>B</option>
                            <option>C</option>
                        </select>
                    </div>
              </form>
            </div><!-- Col dos campos de texto -->
              
            <div id="coluna2" class="col">
                
                <ol class="breadcrumb">
                  <li class="breadcrumb-item active">Imagem de Perfil</li>
                </ol>
                
                <img class="rounded mx-auto d-block mb-3" src="../resources/imgs/cadastro-img.jpg">
                
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
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Deseja mesmo sair?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Selecione a opção "Sair" para confirmar o termino da sessão.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
          <a class="btn btn-primary" href="login.html">Sair</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="../vendor/jquery/jquery.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../resources/js/sb-admin.min.js"></script>

</body>
</html>