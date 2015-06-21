<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" style="text/css" href="accueil.css" />

</head>
<body>

		<%@ include file="/WEB-INF/views/menus/menu.jsp" %>	
		<p><center> Bienvenu sur le forum </center></p>
 
 	<form class="form-horizontal">
  <div class="form-group" align="center">
    <label for="text" class="col-sm-2 control-label">user name</label>
    <div class="col-sm-10">
      <input type="text"  id="username_etud" placeholder="user name">
    </div>
    <br>
    
  </div>
  <div class="form-group" align="center">
    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
    </div>
  </div>
  <div class="form-group" align="center">
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox"  align="center">
        <label>
          <input type="checkbox"> Remember me
        </label>
      </div>
    </div>
  </div>
  <br>
 		 <label><center> mot de passe oublié</center> </label>
 		 <br>
  <div class="form-group" align="center">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">Sign in</button>
    </div>
  </div>
</form>


</body>
</html>
