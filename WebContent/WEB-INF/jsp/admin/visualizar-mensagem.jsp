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
                  <li class="breadcrumb-item active">Mensagem</li>
                </ol>

                <!-- Page Content -->
                <form>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" id="inputRemetente" readonly value="De: ${mensagem.remetente.nome }">
                    </div>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" id="inputRemetente" readonly value="${mensagem.assunto}">
                    </div>
                    <div class="input-group mb-3">
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" readonly>${mensagem.mensagem}</textarea>
                    </div>
                    <div class="form-lavel-group mb-3 col-12 row">
                        <a href="mensagem" class="btn btn-primary form-control col-4">Voltar</a>
                        <span class="col-4"></span>
                        <span id="deletar-mensagem" data-id="${mensagem.id}" class="btn btn-danger form-control col-4">Deletar</span>
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
  
  <!-- BootBox JS -->
  <script src="./vendor/bootbox/bootbox.min.js"></script>
  <script src="./vendor/bootbox/bootbox.locales.min.js"></script>
  <script>
  $(document).on('click', '#deletar-mensagem', function(){

		var id = $(this).data('id');

		bootbox.confirm({
			title: 'Deletar mensagem',
			message: 'Deseja deletar a mensagem?',
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
						url: '/virtualcondo/mensagem?id=' + id,
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
								window.location.assign('/virtualcondo/mensagem');
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