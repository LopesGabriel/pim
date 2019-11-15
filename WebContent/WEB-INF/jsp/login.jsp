<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="icon" href="./resources/imgs/Logo2.png" type="image/icon">
		
		<title>Virtual Condo - Login</title>
		
		<!-- Custom fonts for this template-->
		<link href="vendor/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
		
		<!-- Custom styles for this template-->
		<link href="resources/css/sb-admin.css" rel="stylesheet">
	</head>
	
	<body class="bg-dark">
	
	  <div class="container">
	    <div class="card card-login mx-auto mt-5">
	      <div class="card-header">Login</div>
	      <div class="card-body">
	        <form action="/virtualcondo/login" method="post">
	          <div class="form-group">
	            <div class="form-label-group">
	              <input type="email" value="${email}" id="inputEmail" name="email" class="form-control" placeholder="Email address" required autofocus="autofocus">
	              <label for="inputEmail">Endereço de E-mail</label>
	            </div>
	          </div>
	          <div class="form-group">
	            <div class="form-label-group">
	              <input type="password" value="${senha}" id="inputPassword" name="senha" class="form-control" placeholder="Password" required>
	              <label for="inputPassword">Senha</label>
	            </div>
	          </div>
	          <c:if test="${msg != null}"><small class="text-danger">${msg}</small></c:if>
	          <div class="float-right">
		          <input type="submit" class="btn btn-success" value="Entrar">
		          <a href="/virtualcondo" class="btn btn-danger">Voltar</a>
			  </div>
	        </form>
	      </div>
	    </div>
	  </div>
	
	  <!-- Bootstrap core JavaScript-->
	  <script src="vendor/jquery/jquery.js"></script>
	  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	  <!-- Core plugin JavaScript-->
	  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	
	</body>
</html>