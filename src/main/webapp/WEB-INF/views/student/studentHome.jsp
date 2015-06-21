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

</head>
<c:url value="student" var="studentH" />
<c:url value="showNote" var="showNote" />
<c:set var="context" value="${pageContext.request.contextPath}" />

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
					<li class="active"><a href="${studentH}">Acceuil</a></li>
					<li><a href='<c:url value="showNote"/>'>Mes Notes</a></li>
					<li><a href='<c:url value=""/>'>Planing</a></li>
					<li><a href='<c:url value=""/>'>Absence</a></li>
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
			<h1>Espace Etudiant</h1>
			<p class="lead">
				Use this document as a way to quickly start any new project.<br>
				All you get is this text and a mostly barebones HTML document.
			</p>
		</div>

		<div class="row">
			<div class="col-lg-3">
				<a href='<c:url value=""/>'> <img class="img-circle"
					src='<c:url value="/resources/images/addNote.png"/>'
					alt="Generic placeholder image" width="140" height="140">
				</a>
				<h2>Mes notes</h2>
				
			</div>
			<div class="col-lg-3">
				<a href='<c:url value=""/>'> <img class="img-circle"
					src='<c:url value="/resources/images/planning.png"/>'
					alt="Generic placeholder image" width="140" height="140">
				</a>
				<h2>Planing</h2>
				
			</div>
			<div class="col-lg-3">
				<a href='<c:url value=""/>'> <img class="img-circle"
					src='<c:url value="/resources/images/etudiant.png"/>'
					alt="Generic placeholder image" width="140" height="140">
				</a>
				<h2>Absence</h2>
				
			</div>
		</div>
		</div>
</body>
</html>

