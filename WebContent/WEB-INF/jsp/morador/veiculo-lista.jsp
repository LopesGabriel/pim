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
	
	<!-- Nosso estilo -->
	<style>
		.Clicar{
			cursor: pointer;
			color: #007bff;
		}
		
		.Clicar:hover {
			color: #01579b;
			transition: 200ms;
		
		}
	</style>
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
          <li class="breadcrumb-item active">veículos</li>
        </ol>

        <!-- Page Content -->
        <h1>Meus veículos</h1>
          
        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Veículos registrados</div>
          <div class="card-body">
              
            <c:if test="${Usuario.veiculo.marca == null}">
            	<a style="color: #fff;" class="btn btn-info ml-2 mb-4" href="cadastrar-veiculo">Registrar Veículo</a>
            </c:if>
              
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable">
                <thead>
                  <tr>
                    <th>Modelo</th>
                    <th>Vaga</th>
                    <th>Placa</th>
                    <th>Proprietário</th>
                    <th>Opções</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>Marca</th>
                    <th>Vaga</th>
                    <th>Placa</th>
                    <th>Proprietário</th>
                    <th>Opções</th>
                  </tr>
                </tfoot>
                <tbody>
                	<c:choose>
                		<c:when test="${ veiculosMorador.placa != null}">
                			<tr>
			                    <td>${veiculosMorador.marca}</td>
			                    <td>${veiculosMorador.vaga.vaga}</td>
			                    <td>${veiculosMorador.placa}</td>
			                    <td>${Usuario.nome}</td>
			                    <td>
			                        <span id="deletarVeiculo" data-id="${veiculosMorador.id}" class="fas fa-trash Clicar"> Deletar</span> |
			                        <a href="/virtualcondo/veiculo?acao=edit&idVeiculo=${veiculosMorador.id}"><i class="fas fa-edit"> Editar</i></a>
			                    </td>
			                </tr>
                		</c:when>
	                  	<c:otherwise>
	                  		<tr>
			                    <td colspan="4">Você não possui um veículo registrado</td>
			                    <td>
			                        <a href="cadastrar-veiculo">Cadastrar Veículo</a>
			                    </td>
			                </tr>
	                  	</c:otherwise>
	                </c:choose>
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
  
  <!-- BootBox JS -->
  <script src="./vendor/bootbox/bootbox.min.js"></script>
  <script src="./vendor/bootbox/bootbox.locales.min.js"></script>
  <script>
  	$(document).on("click", "#deletarVeiculo", function(e) {
  		var confirmModal = bootbox.confirm({ 
  		    size: "small",
  		    title: "Deletar Veiculo",
  		    message: "Tem certeza que deseja deletar esse veículo?",
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
  		    callback: function(result){
  		    	if(result){
  		    		var id = $("#deletarVeiculo").data('id');
  		    		$.ajax({
  		    			url: '/virtualcondo/veiculo?id='+id,
  		    			method: 'Delete',
  		    			success: function(rs){
  		    				window.location.assign('/virtualcondo/veiculo?acao=listar');
  		    				confirmModal = bootbox.dialog({
  		    					size: 'small',
  		    					title: '<span class="text-success">Sucesso <i class="far fa-check-circle text-rigth"></i><span>',
  		    					message: 'Veículo deletado com sucesso'
  		    				})
  		    			},
  		    			error: function(e, xml, err){
  		    				bootbox.dialog({
  		    					size: 'small',
  		    					title: 'Falha',
  		    					message: 'Falha ao se comunicar com o servidor',
  		    					buttons:{
  		    						fechar:{
  		    							label: 'Fechar',
  		    							className: 'btn-danger',
  		    							callback: function() {}
  		    						}
  		    					}
  		    				});
  		    			}
  		    		});//Fim do Ajax
  		    	} // Fim do if
  		    }// Fim do Callback
  		})
    });
  </script>

</body>
</html>