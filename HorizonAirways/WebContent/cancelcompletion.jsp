<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/header.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Horizon Airways</title>
</head>
<body>

	<c:if test="${ empty sessionScope.user}">
		<c:redirect url="/index.jsp" />
	</c:if>
<div class="header">
		<div><a href="./index.jsp"><img src="./images/horizonAirwaysLogo.png" alt="logo" width="200px" height="100px"/></a></div>
		<div>
			<form>
				<input type="submit" name="logout" value="Log out" />
			</form>
		</div>
	</div>
	<h2>You have successfully cancelled your reservation.</h2>
	<a href="./index.jsp">Back to home page</a>

</body>
</html>