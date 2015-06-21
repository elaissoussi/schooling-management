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

<c:url value="students" var="studentsHome" />
<c:url value="teachers" var="teachersHome" />
<c:url value="admins" var="adminsHome" />
<c:url value="cours" var="gestionCours" />
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
					<li><a href='<c:url value="${studentsHome}"/>'>Gestion des étudiants</a></li>
					<li><a href='<c:url value="${teachersHome}"/>'>Gestion des enseignants</a></li>
					<li><a href='<c:url value="${adminsHome}"/>'>Gestion des admins</a></li>
					<li><a href='<c:url value="${gestionCours}"/>'>Gestion des cours</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
			<h1>Géstion des Administrateurs</h1>
			
		<!-- Trigger the modal with a button -->
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
			data-target="#myModal">Add Admin</button>
			<h3>Liste des admins : </h3>
		<div class="starter-template">
			<table id="example" class="display table table-bordered"
				cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>First name</th>
						<th>Last name</th>
						<th>Delete</th>
						<th>Update</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${admins}" var="admin">
						<tr>
							<td>${admin.firstName}</td>
							<td>${admin.lastName}</td>
							<td><a href="deleteAdmin/${admin.id}">Delete</a></td>
							<td><button class="updateAdmin" data-toggle="modal" data-target="#updateModal"
									value="updateAdmin/${admin.id}" >Update</button></td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<!--  Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">

					<!-- formulaire -->
					<div class="container">
						<form class="form-horizontal" method="post" action="addAdmin">
							<div class="form-group">
								<label for="inputFirstName" class="col-sm-2 control-label">Nom</label>
								<div class="col-sm-4">
									<input name="nom" type="text" class="form-control"
										id="inputFirstName">
								</div>
							</div>
							<div class="form-group">
								<label for="inputLastName" class="col-sm-2 control-label">Prénom</label>
								<div class="col-sm-4">
									<input name="prenom" type="text" class="form-control"
										id="inputLastName">
								</div>
							</div>

							<div class="form-group">
								<label for="inputLogin" class="col-sm-2 control-label">Login</label>
								<div class="col-sm-4">
									<input name="login" type="text" class="form-control"
										id="inputLogin">
								</div>
							</div>
							<div class="form-group">
								<label for="inputpassword" class="col-sm-2 control-label">Mot
									De passe</label>
								<div class="col-sm-4">
									<input name="motdepasse" type="text" class="form-control"
										id="inputpassword">
								</div>
							</div>

							<div class="form-group">
								<label for="inputmail" class="col-sm-2 control-label">Email</label>
								<div class="col-sm-4">
									<input name="email" type="email" class="form-control"
										id="inputmail">
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


	<!-- Update modal -->
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
							<form class="form-horizontal" method="post" id="updateModalForm" >
								<div class="form-group">
									<label for="inputFirstName" class="col-sm-2 control-label">Nom</label>
									<div class="col-sm-4">
										<input name="nom" type="text" class="form-control"
											id="inputFirstName">
									</div>
								</div>
								<div class="form-group">
									<label for="inputLastName" class="col-sm-2 control-label">Prénom</label>
									<div class="col-sm-4">
										<input name="prenom" type="text" class="form-control"
											id="inputLastName">
									</div>
								</div>

								<div class="form-group">
									<label for="inputLogin" class="col-sm-2 control-label">Login</label>
									<div class="col-sm-4">
										<input name="login" type="text" class="form-control"
											id="inputLogin">
									</div>
								</div>
								<div class="form-group">
									<label for="inputpassword" class="col-sm-2 control-label">Mot
										De passe</label>
									<div class="col-sm-4">
										<input name="motdepasse" type="text" class="form-control"
											id="inputpassword">
									</div>
								</div>

								<div class="form-group">
									<label for="inputmail" class="col-sm-2 control-label">Email</label>
									<div class="col-sm-4">
										<input name="email" type="email" class="form-control"
											id="inputmail">
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
		<!-- /modal -->
	<script type="text/javascript">
			$(document).ready(function() {
				$('#example').dataTable();
				// on click  of update fill the form 
				$('.updateAdmin').click(function() {
					var updateUrl = $(this).val();
					$("#updateModalForm").attr("action", updateUrl);
				});
			});
		</script>
</body>
</html>

