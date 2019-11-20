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
	<link href="./vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	
	<!-- Custom styles for this template-->
	<link href="./resources/css/sb-admin.css" rel="stylesheet">

	<style>
		.Clicar{
			cursor: pointer;
		}
	</style>

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
            <a href="index.html">Painel de Controle</a>
          </li>
          <li class="breadcrumb-item active">Nova página</li>
        </ol>

        <!-- Page Content -->
        <h1>Lista de moradores</h1>
          
        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Nome e Email</div>
          <div class="card-body">
              
          	<a class="btn btn-info mb-3" href="/virtualcondo/moradores?acao=cadastrar">Cadastrar morador</a>
              
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>Nome</th>
                    <th>Email</th>
                    <th class="text-center">Opções</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>Nome</th>
                    <th>Email</th>
                    <th class="text-center">Opções</th>
                  </tr>
                </tfoot>
                <tbody>
                	<c:forEach items="${moradores}" var="morador">
	                  <tr data-cpf="${morador.cpf}" data-nome="${morador.nome}">
	                    <td>${morador.nome}</td>
	                    <td>${morador.email}</td>
	                    <td>
		                    <div class="mx-auto col-sm-12 col-lg-4">
		                    	<i id="deletar-morador" class="fas fa-trash float-left Clicar" data-id="${morador.id}" title="Deletar" data-toggle="tooltip" data-placement="left"></i>
		                        <a href="/virtualcondo/moradores?acao=editar&id=${morador.id}"
		                        class="fas fa-edit float-right" title="Editar" data-toggle="tooltip" data-placement="left"></a>
		                    </div>
	                    </td>
	                  </tr>
                	</c:forEach>
                </tbody>
              </table>
            </div>
          </div>
          <div class="card-footer small text-muted">Se beber, não dirija!</div>
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
  
  <!-- Bootbox -->
  <script src="./vendor/bootbox/bootbox.all.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="./vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="./resources/js/sb-admin.min.js"></script>

<script>

$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();
});

$(document).on('click', '#deletar-morador', function(){

	var uid = $(this).data('id');
	var cpf = $(this).parent().parent().parent().data('cpf');
	var nome = $(this).parent().parent().parent().data('nome');
	var linha = $(this).parent().parent().parent();

	bootbox.confirm({
		title: 'Deseja deletar o usuário?',
		message: 'Nome: ' + nome + '<br>CPF: ' + cpf,
		buttons:{
			confirm:{
				label: 'Sim',
				className: 'btn-success'
			},
			cancel:{
				label: 'Não',
				className: 'btn-danger'
			}
		},
		callback: function(confirmacao){
			if(confirmacao){
				$.ajax({
					url: '/virtualcondo/moradores?uid=' + uid,
					method: 'delete',
					dataType: 'json',
					success: function(rs){
						var ttl;
						var msg = "";
						var ex = rs.ex;

						switch(rs.status){
						case true:
							ttl = '<span class="text-success"><i class="far fa-check-circle"></i> Sucesso</span>';
							msg = rs.msg;
							linha.remove();
							break;
						case false:
							ttl = '<span class="text-danger"><i class="fas fa-exclamation"></i> Oops</span>';
							msg = rs.msg;
							if(ex) msg += '<br>' + ex;
							break;
						}

						bootbox.dialog({
							title: ttl,
							message: msg,
							buttons:{
								fechar:{
									label: 'Fechar',
									className: 'btn-danger',
									callback: function(){}
								}
							}
						});

					}
				});
			}
		}
	});

});

</script>

</body>
</html>