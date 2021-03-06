<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<title>Login Page</title>
<!-- Bootstrap -->

<link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>"
	rel="stylesheet">

<link
	href="<c:url value="/resources/bootstrap/css/starter-template.css"/>"
	rel="stylesheet">

<!-- Datatables -->
<script type="text/javascript"
	src="<c:url value="/resources/datatable/js/jquery.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/datatable/js/jquery.dataTables.min.js"/>"></script>



</head>

<c:url value="student" var="studentH" />
<c:url value="showNote" var="showNote" />
<c:url value="planing" var="planing" />
<body>
	<nav class="navbar  navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"> Gestion Scolarité</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="${accueilTeacher}">Acceuil</a></li>
					<li><a href='<c:url value="showNote"/>'>Mes Notes</a></li>
					<li><a href='<c:url value="planing"/>'>Planning</a></li>
					<li><a href='<c:url value=""/>'>Absence</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<h3>Planning:</h3>

		<c:forEach items="${niveaux}" var="niveau">
			<h3>
				<a
					href="<c:url value="/resources/planning/planning-${niveau.nomNiveau}.pdf"/>">
					${niveau.nomNiveau}</a>
			</h3>
			<br>
		</c:forEach>
	</div>
</body>
</html>

