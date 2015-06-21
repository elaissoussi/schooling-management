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
<!-- <script type="text/javascript" -->
<!-- 	src="//cdn.datatables.net/plug-ins/1.10.7/integration/jqueryui/dataTables.jqueryui.js"></script> -->
<!-- <link -->
<!-- 	href="//cdn.datatables.net/plug-ins/1.10.7/integration/jqueryui/dataTables.jqueryui.css"" -->
<!-- 	rel="stylesheet"> -->
<script type="text/javascript"
	src="<c:url value="/resources/datatable/js/jquery.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/datatable/js/jquery.dataTables.min.js"/>"></script>



</head>
<c:url value="note" var="note" />
<c:url value="/teacher" var="accueilTeacher" />
<c:url value="showProf" var="showProf" />
<body>
	<nav class="navbar  navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"> Gestion Scolarité</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="${accueilTeacher}">Acceuil</a></li>
					<li><a href='<c:url value="${note}"/>'>Saisir les notes</a></li>
					<li><a href='<c:url value="${showProf}"/>'>consulter la
							liste des Profs</a></li>
					<li><a href='<c:url value=""/>'>consulter la liste des
							étudiants</a></li>
					<li><a href='<c:url value=""/>'>Publier un avis</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<h1>ajouter note</h1>
		<h3>Liste des étudiants :</h3>

		<form method="GET" action="getStudentsForSubject">
			<label>veuillez selectionner la matiere</label> 
			<select
				name="selectedSubject" id="subjectSelect">
				<c:forEach var="item" items="${matieres}">
					<option value="${item.id}">${item.nomMatiere}</option>
				</c:forEach>
			</select>
			<button type="submit" class="btn btn-primary">Valider</button>
		</form>

		<div class="starter-template">
			<form action="addNotes" method="post">
				<table id="example" class="display table table-bordered"
					cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>First name</th>
							<th>Last name</th>
							<th>Note</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach items="${etudiants}" var="student">
							<tr>
								<td>${student.firstName}</td>
								<td>${student.lastName}</td>
								<td><input name ="note_${student.id}"  type="number"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-primary">Add</button>

					</div>
				</div>
			</form>

		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#example').dataTable();
		});
	</script>
</body>
</html>

