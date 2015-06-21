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
<link href="<c:url value="/resources/bootstrap/css/signin.css"/>"
	rel="stylesheet">
<link
	href="<c:url value="/resources/bootstrap/css/starter-template.css"/>"
	rel="stylesheet">

<!-- Jsp  -->
<c:set var="context" value="${pageContext.request.contextPath}" />

</head>
<body>
	<div class="container">
		<div class="starter-template">

			<div>
				<c:if test="${authorizationError}">
				<div class="alert alert-danger fade in">
						<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>Error!</strong>
						"Authorization failed" : please authenticate !!!
				</div>
				</c:if>
				<c:if test="${authenticateError}">
					<div class="alert alert-danger fade in">
						<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>Error!</strong>
						"Authentication failed" : please check your identifiers and type
						it again .
					</div>
				</c:if>
			</div>

			<h1>Schooling Management</h1>
			<p class="lead">
				Use this document as a way to quickly start any new project.<br>
				All you get is this text and a mostly barebones HTML document.
			</p>
			<form:form class="form-signin" method="POST" action="${context}/login">
				<h4 class="form-signin-heading">Entrez vos identifiants</h4>
				<label for="inputEmail" class="sr-only">Email address</label>
				<input name="username" class="form-control" placeholder="login"
					required autofocus>
				<br />
				<label for="inputPassword" class="sr-only">Password</label>
				<input type="password" name="password" class="form-control"
					placeholder="mot de passe" required>
				<br />
				<button class="btn btn-lg btn-primary btn-block" type="submit">
					Connexion</button>
			</form:form>

		</div>
	</div>
	<!-- /container -->
</body>
</html>

