<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
	  	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	  	<meta name="description" content="">
	  	<meta name="author" content="">
	  	
		<title>Virtual Condo - Página inicial</title>
		
		<!-- Bootstrap core CSS -->
	  	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	  	<!-- Custom fonts for this template -->
	  	<link href="./vendor/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
	  	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
	  	<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
	  	<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
	  	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
	
	  	<!-- Custom styles for this template -->
	  	<link href="./resources/css/agency.css" rel="stylesheet">
  
	</head>
	<body id="page-top">

	  <!-- Navigation -->
	  <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
	    <div class="container">
	      <a class="navbar-brand js-scroll-trigger" href="#page-top">Virtual Condo</a>
	      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive"
	      aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
	        Menu
	        <i class="fas fa-bars"></i>
	      </button>
	      <div class="collapse navbar-collapse" id="navbarResponsive">
	        <ul class="navbar-nav text-uppercase ml-auto">
	          <li class="nav-item">
	            <a class="nav-link js-scroll-trigger" href="#services">Serviços</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link js-scroll-trigger" href="#about">Sobre</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link js-scroll-trigger" href="#team">Time</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link js-scroll-trigger" href="#contact">Contato</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link js-scroll-trigger active" href="login.html">Fazer login</a>
	          </li>
	        </ul>
	      </div>
	    </div>
	  </nav>
	
	  <!-- Header -->
	  <header class="masthead">
	    <div class="container">
	      <div class="intro-text">
	        <div class="intro-lead-in">Bem-Vindos ao Virtual Condo!</div>
	        <div class="intro-heading text-uppercase">É UM PRAZER TE RECEBER</div>
	        <a class="btn btn-secondary btn-xl text-uppercase js-scroll-trigger" href="#services">Descubra mais</a>
	      </div>
	    </div>
	  </header>
	
	  <!-- Services -->
	  <section id="services">
	    <div class="container">
	      <div class="row">
	        <div class="col-lg-12 text-center">
	          <h2 class="section-heading text-uppercase">Serviços</h2>
	          <h3 class="section-subheading text-muted">Conheça alguns de nossos serviços.</h3>
	        </div>
	      </div>
	      <div class="row text-center">
	        <div class="col-md-4">
	          <span class="fa-stack fa-4x">
	            <i class="fas fa-circle fa-stack-2x text-primary"></i>
	            <i class="fas fa-user-shield fa-stack-1x fa-inverse"></i>
	          </span>
	          <h4 class="service-heading">Segurança</h4>
	          <p class="text-muted">Nosso software traz uma segurança de primeira qualidade para os moradores e usuários do sistema. Todos os seus dados são bem protegidos.</p>
	        </div>
	        <div class="col-md-4">
	          <span class="fa-stack fa-4x">
	            <i class="fas fa-circle fa-stack-2x text-primary"></i>
	            <i class="fas fa-question-circle fa-stack-1x fa-inverse"></i>
	          </span>
	          <h4 class="service-heading">Suporte</h4>
	          <p class="text-muted">Caso tenha algum problema e/ou dúvida com o software, entre em contato com a nossa equipe de desenvolvedores. Ficaremos felizes em auxilia-lo</p>
	        </div>
	        <div class="col-md-4">
	          <span class="fa-stack fa-4x">
	            <i class="fas fa-circle fa-stack-2x text-primary"></i>
	            <i class="fas fa-envelope fa-stack-1x fa-inverse"></i>
	          </span>
	          <h4 class="service-heading">Comunicação</h4>
	          <p class="text-muted">Oferecemos um serviço de comunicação para os usuários cadastrados no sistema. Os usuários podem trocar mensagens a qualquer horário do dia.</p>
	        </div>
	      </div>
	    </div>
	  </section>
	
	  <!-- About -->
	  <section id="about">
	    <div class="container">
	      <div class="row">
	        <div class="col-lg-12 text-center">
	          <h2 class="section-heading text-uppercase">Sobre nós</h2>
	          <h3 class="section-subheading text-muted">Conheça um pouco sobre nós.</h3>
	        </div>
	      </div>
	      <div class="row">
	        <div class="col-lg-12">
	          <ul class="timeline">
	            <li>
	              <div class="timeline-image">
	                <img class="rounded-circle img-fluid" src="resources/imgs/about/1.jpg" alt="">
	              </div>
	              <div class="timeline-panel">
	                <div class="timeline-heading">
	                  <h4>Abril de 2019</h4>
	                  <h4 class="subheading">O início</h4>
	                </div>
	                <div class="timeline-body">
	                  <p class="text-muted">No início de 2019 nós começamos o projeto com o intuito de facilitar e trazer uma melhor praticidade para com a administração de um condomínio.</p>
	                </div>
	              </div>
	            </li>
	            <li class="timeline-inverted">
	              <div class="timeline-image">
	                <img class="rounded-circle img-fluid" src="resources/imgs/about/2.jpg" alt="">
	              </div>
	              <div class="timeline-panel">
	                <div class="timeline-heading">
	                  <h4>Maio de 2019</h4>
	                  <h4 class="subheading">Tomadas de decisões</h4>
	                </div>
	                <div class="timeline-body">
	                  <p class="text-muted">Com o projeto iniciado foi necessário um tempo para decidirmos qual rumo tomar.</p>
	                </div>
	              </div>
	            </li>
	            <li class="timeline-inverted">
	              <div class="timeline-image">
	                <h4>Faça parte
	                  <br>Da nossa
	                  <br>História!</h4>
	              </div>
	            </li>
	          </ul>
	        </div>
	      </div>
	    </div>
	  </section>
	
	  <!-- Team -->
	  <section class="bg-light" id="team">
	    <div class="container">
	      <div class="row">
	        <div class="col-lg-12 text-center">
	          <h2 class="section-heading text-uppercase">Nossa equipe</h2>
	          <h3 class="section-subheading text-muted">Nossa equipe é formada pelos seguintes membros.</h3>
	        </div>
	      </div>
	      <div class="row">
	        <div class="col-sm-4">
	          <div class="team-member">
	            <img class="mx-auto rounded-circle" src="resources/imgs/team/1.jpg" alt="">
	            <h4>Matheus Lopes</h4>
	            <p class="text-muted">Estudante de ADS</p>
	            <ul class="list-inline social-buttons">
	              <li class="list-inline-item">
	                <a target="_blank" href="https://www.instagram.com/matheus.kns">
	                  <i class="fab fa-instagram"></i>
	                </a>
	              </li>
	              <li class="list-inline-item">
	                <a target="_blank" href="https://www.facebook.com/MatheusNimbo">
	                  <i class="fab fa-facebook-f"></i>
	                </a>
	              </li>
	              <li class="list-inline-item">
	                <a target="_blank" href="https://www.linkedin.com/in/matheuslopes1999">
	                  <i class="fab fa-linkedin-in"></i>
	                </a>
	              </li>
	            </ul>
	          </div>
	        </div>
	        <div class="col-sm-4">
	          <div class="team-member">
	            <img class="mx-auto rounded-circle" src="resources/imgs/team/2.jpg" alt="">
	            <h4>Gabriel Lopes</h4>
	            <p class="text-muted">Estudante de ADS</p>
	            <ul class="list-inline social-buttons">
	              <li class="list-inline-item">
	                <a target="_blank" href="https://www.instagram.com/gabriel.310/">
	                  <i class="fab fa-instagram"></i>
	                </a>
	              </li>
	              <li class="list-inline-item">
	                <a target="_blank" href="https://www.facebook.com/gabriel.oliveiralopes.98">
	                  <i class="fab fa-facebook-f"></i>
	                </a>
	              </li>
	              <li class="list-inline-item">
	                <a target="_blank" href="https://www.linkedin.com/in/gabriel-de-oliveira-lopes-b97093179/">
	                  <i class="fab fa-linkedin-in"></i>
	                </a>
	              </li>
	            </ul>
	          </div>
	        </div>
	        <div class="col-sm-4">
	          <div class="team-member">
	            <img class="mx-auto rounded-circle" src="resources/imgs/team/3.jpg" alt="">
	            <h4>Silvio Suguino</h4>
	            <p class="text-muted">Estudante de ADS</p>
	            <ul class="list-inline social-buttons">
	              <li class="list-inline-item">
	                <a target="_blank" href="https://www.instagram.com/silviosuguinof/">
	                  <i class="fab fa-instagram"></i>
	                </a>
	              </li>
	              <!--<li class="list-inline-item">
	                <a target="_blank" href="#">
	                  <i class="fab fa-facebook-f"></i>
	                </a>
	              </li>-->
	              <li class="list-inline-item">
	                <a target="_blank" href="https://www.linkedin.com/in/silvio-suguino-filho-b4978b169/">
	                  <i class="fab fa-linkedin-in"></i>
	                </a>
	              </li>
	            </ul>
	          </div>
	        </div>
	      </div>
	      <div class="row">
	        <div class="col-lg-8 mx-auto text-center">
	          <p class="large text-muted">Composta por 3 integrantes, nossa equipe foi formada com o propósito de atender a seus requisitos.</p>
	        </div>
	      </div>
	    </div>
	  </section>
	
	  <!-- Contact -->
	  <section id="contact">
	    <div class="container">
	      <div class="row">
	        <div class="col-lg-12 text-center">
	          <h2 class="section-heading text-uppercase">Entre em contato</h2>
	          <h3 class="section-subheading text-muted">Envie-nos uma mensagem.</h3>
	        </div>
	      </div>
	      <div class="row">
	        <div class="col-lg-12">
	          <form id="contactForm" name="sentMessage" novalidate="novalidate">
	            <div class="row">
	              <div class="col-md-6">
	                <div class="form-group">
	                  <input class="form-control" id="name" type="text" placeholder="Seu nome *" required="required" data-validation-required-message="Please enter your name.">
	                  <p class="help-block text-danger"></p>
	                </div>
	                <div class="form-group">
	                  <input class="form-control" id="email" type="email" placeholder="Seu e-mail *" required="required" data-validation-required-message="Please enter your email address.">
	                  <p class="help-block text-danger"></p>
	                </div>
	                <div class="form-group">
	                  <input class="form-control" id="phone" type="tel" placeholder="Seu telefone *" required="required" data-validation-required-message="Please enter your phone number.">
	                  <p class="help-block text-danger"></p>
	                </div>
	              </div>
	              <div class="col-md-6">
	                <div class="form-group">
	                  <textarea class="form-control" id="message" placeholder="Digite sua mensagem *" required="required" data-validation-required-message="Please enter a message."></textarea>
	                  <p class="help-block text-danger"></p>
	                </div>
	              </div>
	              <div class="clearfix"></div>
	              <div class="col-lg-12 text-center">
	                <div id="success"></div>
	                <button id="sendMessageButton" class="btn btn-primary btn-xl text-uppercase" type="submit">Enviar mensagem</button>
	              </div>
	            </div>
	          </form>
	        </div>
	      </div>
	    </div>
	  </section>
	
	  <!-- Footer -->
	  <footer>
	    <div class="container">
	      <div class="row">
	        <div class="col-md-4">
	          <span class="copyright">Copyright &copy; Virtual Condo</span>
	        </div>
	        <div class="col-md-4">
	        </div>
	        <div class="col-md-4">
	          <ul class="list-inline quicklinks">
	            <li class="list-inline-item">
	              <a href="#">Politica de privacidade</a>
	            </li>
	            <li class="list-inline-item">
	              <a href="#">Termos de uso</a>
	            </li>
	          </ul>
	        </div>
	      </div>
	    </div>
	  </footer>
	
	  <!-- Portfolio Modals -->
	
	  <!-- Modal 1 -->
	  <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
	    <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="close-modal" data-dismiss="modal">
	          <div class="lr">
	            <div class="rl"></div>
	          </div>
	        </div>
	        <div class="container">
	          <div class="row">
	            <div class="col-lg-8 mx-auto">
	              <div class="modal-body">
	                <!-- Project Details Go Here -->
	                <h2 class="text-uppercase">Project Name</h2>
	                <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
	                <img class="img-fluid d-block mx-auto" src="resources/imgs/portfolio/01-full.jpg" alt="">
	                <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
	                <ul class="list-inline">
	                  <li>Date: January 2017</li>
	                  <li>Client: Threads</li>
	                  <li>Category: Illustration</li>
	                </ul>
	                <button class="btn btn-primary" data-dismiss="modal" type="button">
	                  <i class="fas fa-times"></i>
	                  Close Project</button>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	
	  <!-- Modal 2 -->
	  <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
	    <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="close-modal" data-dismiss="modal">
	          <div class="lr">
	            <div class="rl"></div>
	          </div>
	        </div>
	        <div class="container">
	          <div class="row">
	            <div class="col-lg-8 mx-auto">
	              <div class="modal-body">
	                <!-- Project Details Go Here -->
	                <h2 class="text-uppercase">Project Name</h2>
	                <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
	                <img class="img-fluid d-block mx-auto" src="resources/imgs/portfolio/02-full.jpg" alt="">
	                <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
	                <ul class="list-inline">
	                  <li>Date: January 2017</li>
	                  <li>Client: Explore</li>
	                  <li>Category: Graphic Design</li>
	                </ul>
	                <button class="btn btn-primary" data-dismiss="modal" type="button">
	                  <i class="fas fa-times"></i>
	                  Close Project</button>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	
	  <!-- Modal 3 -->
	  <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
	    <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="close-modal" data-dismiss="modal">
	          <div class="lr">
	            <div class="rl"></div>
	          </div>
	        </div>
	        <div class="container">
	          <div class="row">
	            <div class="col-lg-8 mx-auto">
	              <div class="modal-body">
	                <!-- Project Details Go Here -->
	                <h2 class="text-uppercase">Project Name</h2>
	                <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
	                <img class="img-fluid d-block mx-auto" src="resources/imgs/portfolio/03-full.jpg" alt="">
	                <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
	                <ul class="list-inline">
	                  <li>Date: January 2017</li>
	                  <li>Client: Finish</li>
	                  <li>Category: Identity</li>
	                </ul>
	                <button class="btn btn-primary" data-dismiss="modal" type="button">
	                  <i class="fas fa-times"></i>
	                  Close Project</button>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	
	  <!-- Modal 4 -->
	  <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true">
	    <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="close-modal" data-dismiss="modal">
	          <div class="lr">
	            <div class="rl"></div>
	          </div>
	        </div>
	        <div class="container">
	          <div class="row">
	            <div class="col-lg-8 mx-auto">
	              <div class="modal-body">
	                <!-- Project Details Go Here -->
	                <h2 class="text-uppercase">Project Name</h2>
	                <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
	                <img class="img-fluid d-block mx-auto" src="resources/imgs/portfolio/04-full.jpg" alt="">
	                <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
	                <ul class="list-inline">
	                  <li>Date: January 2017</li>
	                  <li>Client: Lines</li>
	                  <li>Category: Branding</li>
	                </ul>
	                <button class="btn btn-primary" data-dismiss="modal" type="button">
	                  <i class="fas fa-times"></i>
	                  Close Project</button>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	
	  <!-- Modal 5 -->
	  <div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-hidden="true">
	    <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="close-modal" data-dismiss="modal">
	          <div class="lr">
	            <div class="rl"></div>
	          </div>
	        </div>
	        <div class="container">
	          <div class="row">
	            <div class="col-lg-8 mx-auto">
	              <div class="modal-body">
	                <!-- Project Details Go Here -->
	                <h2 class="text-uppercase">Project Name</h2>
	                <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
	                <img class="img-fluid d-block mx-auto" src="resources/imgs/portfolio/05-full.jpg" alt="">
	                <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
	                <ul class="list-inline">
	                  <li>Date: January 2017</li>
	                  <li>Client: Southwest</li>
	                  <li>Category: Website Design</li>
	                </ul>
	                <button class="btn btn-primary" data-dismiss="modal" type="button">
	                  <i class="fas fa-times"></i>
	                  Close Project</button>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	
	  <!-- Modal 6 -->
	  <div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-hidden="true">
	    <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="close-modal" data-dismiss="modal">
	          <div class="lr">
	            <div class="rl"></div>
	          </div>
	        </div>
	        <div class="container">
	          <div class="row">
	            <div class="col-lg-8 mx-auto">
	              <div class="modal-body">
	                <!-- Project Details Go Here -->
	                <h2 class="text-uppercase">Project Name</h2>
	                <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
	                <img class="img-fluid d-block mx-auto" src="resources/imgs/portfolio/06-full.jpg" alt="">
	                <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
	                <ul class="list-inline">
	                  <li>Date: January 2017</li>
	                  <li>Client: Window</li>
	                  <li>Category: Photography</li>
	                </ul>
	                <button class="btn btn-primary" data-dismiss="modal" type="button">
	                  <i class="fas fa-times"></i>
	                  Close Project</button>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	
	  <!-- Bootstrap core JavaScript -->
	  <script src="./vendor/jquery/jquery.js"></script>
	  <script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	  <!-- Plugin JavaScript -->
	  <script src="./vendor/jquery-easing/jquery.easing.min.js"></script>
	
	  <!-- Contact form JavaScript -->
	  <script src="./resources/js/jqBootstrapValidation.js"></script>
	  <script src="./resources/js/contact_me.js"></script>
	
	  <!-- Custom scripts for this template -->
	  <script src="./resources/js/agency.min.js"></script>
	
	</body>
</html>