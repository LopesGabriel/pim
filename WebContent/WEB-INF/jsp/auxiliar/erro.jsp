<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="icon" href="./resources/imgs/Logo2.png" type="image/icon">
	<title>Virtual Condo</title>
	
	<!-- Custom fonts for this template-->
	<link href="./vendor/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
	
	<!-- Custom styles for this template-->
	<link href="./resources/css/sb-admin.css" rel="stylesheet">
</head>
<body>
	<c:choose>
		<c:when test="${Usuario.tipoUsu.id == 2}">
			<c:import url="../utils/admin/header.jsp"></c:import>

			<div class="wrapper">
			
				<c:import url="../utils/admin/sider.jsp"></c:import>
	
				<div id="content-wrapper">
					<div class="container-fluid">
						<h3 class="text-info">
							Algo de inesperado ocorreu.
						</h3>
						<p class="text-danger text-justify">
							Erro: ${msg}
						</p>
						<hr>
						<p class="text-info">
							Entre em contato com o suporte.
							<br> Gabriel de Oliveira Lopes (61) 9 8235-2349
							<br> Matheus de Oliveira Lopes (61) 9 8151-0636
						</p>
					</div>
				</div>

			</div>
		</c:when>
		<c:when test="${Usuario.tipoUsu.id == 1}">
			<c:import url="../utils/morador/header.jsp"></c:import>

			<div class="wrapper">
			
				<c:import url="../utils/morador/sider.jsp"></c:import>
	
				<div id="content-wrapper">
					<div class="container-fluid">
						<h3 class="text-info">
							Algo de inesperado ocorreu.
						</h3>
						<p class="text-danger text-justify">
							Erro: ${msg}
						</p>
						<hr>
						<p class="text-info">
							Entre em contato com o suporte.
							<br> Gabriel de Oliveira Lopes (61) 9 8235-2349
							<br> Matheus de Oliveira Lopes (61) 9 8151-0636
						</p>
					</div>
				</div>

			</div>
		</c:when>
		<c:otherwise>
			<c:import url="../utils/colaborador/header.jsp"></c:import>

			<div class="wrapper">
			
				<c:import url="../utils/colaborador/sider.jsp"></c:import>
	
				<div id="content-wrapper">
					<div class="container-fluid">
						<h3 class="text-info">
							Algo de inesperado ocorreu.
						</h3>
						<p class="text-danger text-justify">
							Erro: ${msg}
						</p>
						<hr>
						<p class="text-info">
							Entre em contato com o suporte.
							<br> Gabriel de Oliveira Lopes (61) 9 8235-2349
							<br> Matheus de Oliveira Lopes (61) 9 8151-0636
						</p>
					</div>
				</div>

			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>