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

<!-- Style -->

<style type="text/css">

.error-template {
	padding: 40px 15px;
	text-align: center;
}

.error-actions {
	margin-top: 15px;
	margin-bottom: 15px;
}

.error-actions .btn {
	margin-right: 10px;
}
</style>
</head>
<body>


	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="error-template">
					<h1>Oops!</h1>
					<h2>404 Not Found</h2>
					<div class="error-details"> Requested page not found! </div>
					<div class="error-actions">
						<a href="${context}"
							class="btn btn-primary btn-lg"><span
							class="glyphicon glyphicon-home"></span> Take Me Home </a>
						<a href="mailto:houssam.rabhi@gmail.com"
							class="btn btn-default btn-lg"><span
							class="glyphicon glyphicon-envelope"></span> Contact Support </a>
					</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>

