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
            <a href="index.html">Painel de Controle</a>
          </li>
          <li class="breadcrumb-item active">Apartamento</li>
        </ol>

        <!-- Page Content -->
        <h1>Editar apartamento</h1>
        <hr>
        <form>
            <div class="form-label-group mb-3">
                <label for="inputProprietario">Proprietário</label>
                <input class="form-control" id="inputProprietario" type="text">
            </div>
            <div class="form-label-group mb-3">
                <label for="inputUnidade">Unidade</label>
                <input class="form-control" id="inputUnidade" type="text">
            </div>
            <div class="form-label-group mb-3">
                <label for="inputBloco">Bloco</label>
                <input class="form-control" id="inputBloco" type="text">
            </div>
        </form>

        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-id-card"></i>
            Moradores</div>
          <div class="card-body">
              
            <div class="row">  
                <button type="button" style="margin-left: 2em; margin-bottom: 1em;" class="btn btn-info col-4"><a style="color: #fff;" href="cadastro-veiculo.html">Inserir</a></button>
                <span class="col-1"></span>
                <select class="form-group col-5">
                    <option selected>Selecione um morador</option>
                    <option>Gabriel Lopes</option>
                </select>
            </div>  
                
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>Nome</th>
                    <th>Unidade</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>Nome</th>
                    <th>Unidade</th>
                  </tr>
                </tfoot>
                <tbody>
                  <tr>
                    <td>Matheus Lopes</td>
                    <td>1001</td>
                  </tr>
                    <tr>
                    <td>Brenda Stefane</td>
                    <td>1001</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <div class="card-footer small text-muted">Ultima atualização dia 30/04</div>
        </div>
          <div class="form-lavel-group mb-3 col-12 row">
            <input type="button" id="inputSubmit" class="btn btn-primary form-control col-4" value="Confirmar">
            <span class="col-4"></span>
            <input type="button" id="inputCancelar" class="btn btn-danger form-control col-4" value="Cancelar">
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