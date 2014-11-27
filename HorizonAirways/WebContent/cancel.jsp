<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<title>Horizon Airways</title>
</head>
<body>

<form action="./CancelReservation" method="post">
<label for="pnrNo">Please input PNR No: </label><input type="text" name="pnrNo"/>
<input type="submit" value="Find Passenger & Flight Details"/>

<div>

<fieldset>

		<legend>Personal Details Form</legend>
	

		<div>
		
			<label for="firstName">First Name: </label>
			<input type="text"  name="firstName" id="firstName" disabled value="${requestScope.passenger.firstName}">
		</div>
		<div>
			<label for="lastName">Last Name: </label>
			<input type="text" name="lastName" id="lastName" disabled value="${requestScope.passenger.firstName}" >
		</div>
		<div>
			<label for="address">Address: </label>
			<textarea  name="address" id="address" disabled>${requestScope.passenger.lastName}</textarea>
		</div>
		<div>
			<label for="gender">Gender </label>
			<input type="text" name="gender" id="gender" disabled value="${requestScope.passenger.gender}" >
		</div>
		<div>
			<label for="birthDay">Birth Day: </label>
			<input type="date" name="birthDay" id="birthDay" disabled value="${requestScope.passenger.birthDay}">
		</div>
		<div>
			<label for="mobileNo">Mobile Number: </label>
			<input type="text" name="mobileNo" id="mobileNo" disabled value="${requestScope.passenger.mobileNo}">
		</div>
		<div>
			<label for="emailAddress">Email Address: </label>
			<input type="email" name="emailAddress" id="emailAddress" disabled value="${requestScope.passenger.emailAddress}">
		</div>
		
	


	</fieldset>

</div>

</form>

</body>
</html>