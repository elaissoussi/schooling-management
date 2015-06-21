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
</head>


<body>
	<div class="container">

		<form class="form-horizontal" method="post">
			<div class="form-group">
				<label for="inputFirstName" class="col-sm-2 control-label">Nom</label>
				<div class="col-sm-10">
					<input name="nom" type="text" class="form-control" id="inputFirstName"
						>
				</div>
			</div>
			<div class="form-group">
				<label for="inputLastName" class="col-sm-2 control-label">Prénom</label>
				<div class="col-sm-10">
					<input name="prenom" type="text" class="form-control" id="inputLastName"
					>
				</div>
			</div>
			
			<div class="form-group">
				<label for="inputLogin" class="col-sm-2 control-label">Login</label>
				<div class="col-sm-10">
					<input name= "login" type="text" class="form-control" id="inputLogin"
						>
				</div>
			</div>
			<div class="form-group">
				<label for="inputpassword" class="col-sm-2 control-label">Mot De passe</label>
				<div class="col-sm-10">
					<input name="motdepasse" type="text" class="form-control" id="inputpassword"
						>
				</div>
			</div>
			
			<div class="form-group">
				<label for="inputmail" class="col-sm-2 control-label">Email</label>
				<div class="col-sm-10">
					<input name="email" type="email" class="form-control" id="inputmail"
						>
				</div>
			</div>
			
					
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10"></div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary">Ajouter</button>
				</div>
			</div>
		</form>

	</div>
	<!-- /container -->
</body>
</html>

