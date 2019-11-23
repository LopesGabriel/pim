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
                  <li class="breadcrumb-item active">Editar visitante</li>
                </ol>

                <!-- Page Content -->
                <form>
                    <div class="form-label-group mb-3">
                        <input type="text" id="nome" class="form-control" placeholder="Nome" value="${visitante.nome}" required autofocus>
                        <label for="nome">Nome</label>
                    </div> 
                    <div class="form-label-group mb-3">
                        <input type="text" id="cpf" class="form-control" value="${visitante.cpf}" placeholder="CPF">
                        <label for="cpf">CPF</label>
                    </div>
                    <div class="form-label-group mb-3">
                        <input type="text" id="rg" class="form-control" placeholder="RG" value="${visitante.rg}">
                        <label for="rg">RG</label>
                    </div>
                    <div class="form-label-group mb-3">
                        <input type="text" id="telefone" class="form-control" placeholder="Telefone" value="${visitante.telefone}">
                        <label for="telefone">Telefone</label>
                    </div>
                    <input id="uid" type="hidden" value="${visitante.id}">
              </form>
            </div>

		<div class="col-12 mx-auto">
			<button id="btn-confirmar" class="btn btn-primary col-sm-4">Confirmar</button>
			<div class="col-sm-4 float-right">
				<a href="/virtualcondo/visitantes" class="btn btn-danger col-sm-12">Voltar</a>
			</div>
		</div>
              
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
  <script src="./vendor/bootbox/bootbox.all.min.js"></script>
  <script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="./vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="./resources/js/sb-admin.min.js"></script>
<script>
	$(document).ready(function(){

		$('#cpf').mask('000.000.000-00');
		$('#rg').mask('0.000.000');
		$('#telefone').mask('(00) 0 0000-0000');

	});

	$(document).on('click', '#btn-confirmar', function(){

		bootbox.confirm({
			size: 'small',
			title: 'Editar',
			message: 'Deseja atualizar o visitante?',
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
			callback: function(resultado){
				if(resultado){

					var dados = new FormData();
					dados.append('uid', $('#uid').val());
					dados.append('nome', $('#nome').val());
					dados.append('cpf', $('#cpf').val());
					dados.append('rg', $('#rg').val());
					dados.append('telefone', $('#telefone').val());
					dados.append('acao', "editar");

					$.ajax({
						url: '/virtualcondo/visitantes',
						method: 'POST',
						data: dados,
						processData: false,
						cache: false,
						contentType: false,
						dataType: 'json',
			            success: function(rs){
			            	switch(rs.status){
			            	case true:
			            		bootbox.dialog({
			            			size: 'small',
			            			title: 'Sucesso!',
			            			message: rs.msg,
			            			buttons:{
			            				fechar:{
			            					label: 'Fechar',
			            					className: 'btn-danger',
			            					callback: function(){}
			            				}
			            			}
			            		});
			            		break;
			            	case false:
			            		bootbox.dialog({
			            			size: 'small',
			            			title: 'Erro!',
			            			message: rs.msg + '<br>' + rs.ex,
			            			buttons:{
			            				fechar:{
			            					label: 'Fechar',
			            					className: 'btn-danger',
			            					callback: function(){}
			            				}
			            			}
			            		});
			            		break;
			            	}
			            },
			            error: function(requestObject, error, errorThrow){
		            		bootbox.dialog({
		            			size: 'small',
		            			title: 'Erro!',
		            			message: error.message,
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