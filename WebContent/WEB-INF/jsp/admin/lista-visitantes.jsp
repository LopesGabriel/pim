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
<<<<<<< HEAD
            <a href="/virtualcondo/index">Painel de Controle</a>
=======
            <a href="index">Síndico</a>
>>>>>>> b23077206553696708b4ee1c012db9fa83e8b375
          </li>
          <li class="breadcrumb-item active">visitantes</li>
        </ol>

        <!-- Page Content -->
        <h1>Lista de visitantes</h1>
          
        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Visitantes</div>
          <div class="card-body">
          
            <a class="btn btn-primary mb-3" href="/virtualcondo/visitantes?acao=cadastrar">Cadastrar visitante</a>

            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>Nome</th>
                    <th>Telefone</th>
                    <th>CPF</th>
                    <th>RG</th>
                    <th>Ações</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>Nome</th>
                    <th>Telefone</th>
                    <th>CPF</th>
                    <th>RG</th>
                    <th>Ações</th>
                  </tr>
                </tfoot>
                <tbody>
                	<c:forEach items="${visitantes}" var="visitante">
	                	<tr data-nome="${visitante.nome}">
		                    <td>${visitante.nome}</td>
		                    <td>${visitante.telefone}</td>
		                    <td>${visitante.cpf}</td>
		                    <td>${visitante.rg}</td>
		                    <td>
		                    	<div class="mx-auto col-sm-12 col-lg-8">
			                        <i id="deletar-visitante" class="fas fa-trash Clicar" data-id="${visitante.id}" data-nome="${visitante.nome}"
			                        	 data-toggle="tooltip" data-placement="top" title="Deletar"></i>
			                        <a href="/virtualcondo/visitantes?acao=editar&id=${visitante.id}" style="padding-left: 33%;">
			                        	<i class="fas fa-edit" data-toggle="tooltip" data-placement="top" title="Editar"></i>
			                        </a>
			                        <a href="/virtualcondo/visitantes?acao=editar&id=${visitante.id}" class="float-right">
			                        	<i class="fas fa-history" data-toggle="tooltip" data-placement="top" title="Histórico de visitas"></i>
			                        </a>
			                    </div>
		                    </td>
	                    </tr>
                	</c:forEach>
                </tbody>
              </table>
            </div>
          </div>
          <div id="ultima-att" class="card-footer small text-muted"></div>
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
  <script src="./vendor/bootbox/bootbox.all.min.js"></script>
  <script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="./vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="./resources/js/sb-admin.min.js"></script>

<script>
	$(document).ready(function(){
		var data = new Date();
		$("#ultima-att").html(data.toString());
		$('[data-toggle="tooltip"]').tooltip();
	});

	$(document).on('click', '#deletar-visitante', function(){

		var id = $(this).data('id');
		var nome = $(this).data('nome');

		bootbox.confirm({
			size: 'small',
			title: 'Confirme a ação',
			message: 'Deseja deletar o(a) visitante ' + nome + ' ?',
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
			callback: function(acao){
				if(acao){

					var dados = new FormData();
					dados.append('uid', id);

					$.ajax({
						url: '/virtualcondo/visitantes',
						type: 'DELETE',
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
			            		$('tr[data-nome="'+nome+'"]').remove();
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
						error: function(xhr, error, errorThrow){
		            		bootbox.dialog({
		            			size: 'small',
		            			title: 'Erro ' + errorThrow + ' !',
		            			message: 'Confira o log do navegador para mais detalhes',
		            			buttons:{
		            				fechar:{
		            					label: 'Fechar',
		            					className: 'btn-danger',
		            					callback: function(){}
		            				}
		            			}
		            		});
		            		console.log("Request Body: ");
		            		console.log(xhr);
		            		console.log('Error: ');
		            		console.log(error);
						}
					});

				}
			}
		});

	});
</script>

</body>
</html>