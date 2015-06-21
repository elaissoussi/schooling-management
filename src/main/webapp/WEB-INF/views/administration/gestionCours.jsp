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
<title>Gestion des cours</title>
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

<c:url value="students" var="studentsHome" />
<c:url value="teachers" var="teachersHome" />
<c:url value="admins" var="adminsHome" />
<c:url value="cours" var="courHome" />
<c:url value="/admin" var="acceuilAdmin" />
<body>
	<nav class="navbar  navbar-default navbar-fixed-top">
		<div class="container">
			<!-- nav bar -->
			<div class="navbar-header">
				<a class="navbar-brand" href="#"> Gestion Scolarité</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="${acceuilAdmin}">Acceuil</a></li>
					<li><a href='<c:url value="${studentsHome}"/>'>Gestion
							desé étudiants</a></li>
					<li><a href='<c:url value="${teachersHome}"/>'>Gestion des
							enseignants</a></li>
					<li><a href='<c:url value="${adminsHome}"/>'>Gestion des
							admins</a></li>
					<li><a href='<c:url value="${courHome}"/>'>Gestion des
							cours</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<h1>Géstion des cours</h1>

		<!-- Trigger the modal with a button -->
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
			data-target="#matiereModal">Ajouter Matiere</button>
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
			data-target="#moduleModal">Ajouter Module</button>
		<h3>Liste des matieres :</h3>
		<div class="starter-template">
			<table id="example" class="display table table-bordered"
				cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Nom de la matière</th>
						<th>Module</th>
						<th>Coeficient</th>
						<th>Prof responsable</th>
						<th>Delete</th>
						<th>Update</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${matieres}" var="matiere">
						<tr>
							<td>${matiere.nomMatiere}</td>
							<td>${matiere.module.nomModule}</td>
							<td>${matiere.coefMatiere}</td>
							<td>${matiere.prof.firstName} ${matiere.prof.lastName}</td>
							<td><a href="deleteMatiere/${matiere.id}">Delete</a></td>
							<td><button class="updateMatiere" data-toggle="modal"
									data-target="#updateModal" value="updateMatiere/${matiere.id}">Update</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<!--  Modal matiere -->
	<div class="modal fade" id="matiereModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">

					<!-- formulaire -->
					<div class="container">
						<form class="form-horizontal" method="post"
							action="ajouterMatiere">
							<div class="form-group">
								<label for="inputNomMatiere" class="col-sm-2 control-label">Nom
									de matière</label>
								<div class="col-sm-4">
									<input name="nomMatiere" type="text" class="form-control"
										id="inputNomMatiere">
								</div>
							</div>
							<div class="form-group">
								<label for="inputModule" class="col-sm-2 control-label">Module</label>
								<div class="col-sm-4">
									<select name="module" class="form-control">
										<c:forEach var="item" items="${modules}">
											<option value="${item.id}">${item.nomModule}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label for="inputCoeficient" class="col-sm-2 control-label">Coeficient</label>
								<div class="col-sm-4">
									<input name="coeficient" type="text" class="form-control"
										id="inputCoeficient">
								</div>
							</div>
							<div class="form-group">
								<label for="inputProfResponsabl" class="col-sm-2 control-label">Prof
									responsable</label>
								<div class="col-sm-4">
									<select name="professeur" class="form-control">
										<c:forEach var="item" items="${profs}">
											<option value="${item.id}">${item.firstName}
												${item.lastName}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label for="inputProfResponsabl" class="col-sm-2 control-label">Niveau</label>
								<div class="col-sm-4">
									<select name="niveau" class="form-control">
										<c:forEach var="item" items="${niveaux}">
											<option value="${item.id}">${item.nomNiveau}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10"></div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-primary">Add</button>

								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!--  Modal add module -->
	<div class="modal fade" id="moduleModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">

					<!-- formulaire -->
					<div class="container">
						<form class="form-horizontal" method="post" action="ajouterModule">
							<div class="form-group">
								<label for="inputnomModule" class="col-sm-2 control-label">Nom
									de module</label>
								<div class="col-sm-4">
									<input name="nomModule" type="text" class="form-control"
										id="inputnomModule">
								</div>
							</div>
							<div class="form-group">
								<label for="inputNiveau" class="col-sm-2 control-label">Niveau</label>
								<div class="col-sm-4">
									<select name="niveau" class="form-control">
										<c:forEach var="item" items="${niveaux}">
											<option value="${item.id}">${item.nomNiveau}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label for="inputCoeficient" class="col-sm-2 control-label">Coeficient</label>
								<div class="col-sm-4">
									<input name="coeficient" type="text" class="form-control"
										id="inputCoeficient">
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10"></div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-primary">Add</button>

								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!--  Modal updateMatiere -->
	<div class="modal fade" id="updateModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">

					<!-- formulaire -->
					<div class="container">
						<form class="form-horizontal" method="post" id="updateModalForm"
							action="updateMatiere/">
							<div class="form-group">
								<label for="inputNomMatiere" class="col-sm-2 control-label">Nom
									de matière</label>
								<div class="col-sm-4">
									<input name="nomMatiere" type="text" class="form-control"
										id="inputNomMatiere">
								</div>
							</div>
							<div class="form-group">
								<label for="inputModule" class="col-sm-2 control-label">Module</label>
								<div class="col-sm-4">
									<select name="module" class="form-control">
										<c:forEach var="item" items="${modules}">
											<option value="${item.id}">${item.nomModule}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label for="inputCoeficient" class="col-sm-2 control-label">Coeficient</label>
								<div class="col-sm-4">
									<input name="coeficient" type="text" class="form-control"
										id="inputCoeficient">
								</div>
							</div>
							<div class="form-group">
								<label for="inputProfResponsabl" class="col-sm-2 control-label">Prof
									responsable</label>
								<div class="col-sm-4	">
									<select name="professeur" class="form-control">
										<c:forEach var="item" items="${profs}">
											<option value="${item.id}">${item.firstName}
												${item.lastName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="inputProfResponsabl" class="col-sm-2 control-label">Niveau</label>
								<div class="col-sm-4">
									<select name="niveau" class="form-control">
										<c:forEach var="item" items="${niveaux}">
											<option value="${item.id}">${item.nomNiveau}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10"></div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-primary">Update</button>

								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>

	<script type="text/javascript">
			$(document).ready(function() {
				$('#example').dataTable();
				// on click  of update fill the form 
				$('.updateMatiere').click(function() {
					var updateUrl = $(this).val();
					$("#updateModalForm").attr("action", updateUrl);
				});
			});
		</script>


</body>
</html>

