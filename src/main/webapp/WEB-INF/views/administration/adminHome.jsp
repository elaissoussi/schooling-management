<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login Page</title>
<!-- Bootstrap -->

<link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>"
	rel="stylesheet">

<link
	href="<c:url value="/resources/bootstrap/css/starter-template.css"/>"
	rel="stylesheet">

<!-- Jsp  -->
<c:set var="context" value="${pageContext.request.contextPath}" />

</head>
<c:url value="admin" var="AHome" />
<c:url value="admin/students" var="studentsHome" />
<c:url value="admin/teachers" var="teachersHome" />
<c:url value="admin/admins" var="adminHome" />
<c:url value="admin/cours" var="gestionCours" />


<body>
	<nav class="navbar  navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"> Gestion Scolarité</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="">Acceuil</a></li>
					<li><a href='<c:url value="${studentsHome}"/>'>Gestion des
							étudiants</a></li>
					<li><a href='<c:url value="${teachersHome}"/>'>Gestion des
							enseignants</a></li>
					<li><a href='<c:url value="${adminHome}"/>'>Gestion des
							admins</a></li>
					<li><a href='<c:url value="${gestionCours}"/>'>Gestion des
							cours</a></li>
					<li>
						<a  class="btn btn-default" href="${context}/logout">
						  <span class="glyphicon glyphicon-log-out" aria-hidden="true">Logout</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">

		<div class="starter-template">
			<h1>Espace administartion</h1>
			<p class="lead">
				Use this document as a way to quickly start any new project.<br>
				All you get is this text and a mostly barebones HTML document.
			</p>
		</div>

		<div class="row">
			<div class="col-lg-3">
				<a href='<c:url value="${studentsHome}"/>'> <img
					class="img-circle"
					src='<c:url value="/resources/images/etudiant.png"/>'
					alt="Generic placeholder image" width="140" height="140">
				</a>
				<h2>Gestion des étudiants</h2>
				<p>Donec sed odio dui. Etiam porta sem malesuada magna mollis
					euismod. Nullam id dolor id nibh ultricies vehicula ut id elit.
					Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
					Praesent commodo cursus magna.</p>
			</div>
			<div class="col-lg-3">
				<a href='<c:url value="${teachersHome}"/>'> <img
					class="img-circle"
					src='<c:url value="/resources/images/enseignant.png"/>'
					alt="Generic placeholder image" width="140" height="140">
				</a>
				<h2>Gestion des enseignants</h2>
				<p>Duis mollis, est non commodo luctus, nisi erat porttitor
					ligula, eget lacinia odio sem nec elit. Cras mattis consectetur
					purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo,
					tortor mauris condimentum nibh.</p>
			</div>
			<div class="col-lg-3">
				<a href='<c:url value="${adminHome}"/>'> <img class="img-circle"
					src='<c:url value="/resources/images/admin.png"/>'
					alt="Generic placeholder image" width="140" height="140">
				</a>
				<h2>Gestion des administrateurs</h2>
				<p>Duis mollis, est non commodo luctus, nisi erat porttitor
					ligula, eget lacinia odio sem nec elit. Cras mattis consectetur
					purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo,
					tortor mauris condimentum nibh.</p>
			</div>
			<div class="col-lg-3">
				<a href='<c:url value="${gestionCours}"/>'> <img
					class="img-circle"
					src='<c:url value="/resources/images/cours.png"/>'
					alt="Generic placeholder image" width="140" height="140">
				</a>
				<h2>Gestion des cours</h2>
				<p>Donec sed odio dui. Etiam porta sem malesuada magna mollis
					euismod. Nullam id dolor id nibh ultricies vehicula ut id elit.
					Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
					Praesent commodo cursus magna.</p>
			</div>
		</div>
	</div>
</body>
</html>

