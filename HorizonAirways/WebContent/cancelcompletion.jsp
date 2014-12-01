<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/header.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Horizon Airways</title>
<link rel="stylesheet" href="css/ticket.css">
</head>
<body>

	<c:if test="${ empty sessionScope.user}">
		<c:redirect url="/index.jsp" />
	</c:if>
<div class="header">
		<div><a href="./index.jsp"><img src="./images/horizonAirwaysLogo.png" alt="logo" width="200px" height="100px"/></a></div>
		<div>
			<form action="./logout" method="get">
				<input type="submit" name="logout" value="Log out" />
			</form>
		</div>
	</div>
	
			<h2>You have successfully cancelled your reservation.</h2>
	<br />
	
	
	<div id="passengerTicket">
		<div id="header">
			<p>
				Horizon Airways<br />Passenger Refund Receipt
			</p>
		</div>
		<div>
			<p id="dateOfIssue">Date of Issue: ${passenger.formattedDate }</p>
			<p class="ticketDetails">Passenger Name:
				${passenger.firstName }&nbsp; ${passenger.lastName }<p><p class="ticketDetails"></p>
			
			
			<div class="flightDetails">
			<p class="ticketDetails">Sector: ${requestScope.firstFlight.sectorId }</p>
			<table>
				
				<tr class="tableHeader">
					<th>Flight #:</th>
					<th>Class:</th>
					<th>Date:</th>
					<th>Dep. Time:</th>
					<th>Arr. Time:</th>
					<th>Status:</th>
					<th>Price:</th>
				</tr>
				
				<tr>
					<td>${requestScope.reservedFlight1.flightNo }</td>
					<td>${requestScope.reservedFlight1.seatClass }</td>
					<td>${requestScope.reservedFlight1.flightDate }</td>
					<td>${requestScope.firstFlight.departureTime }</td>
					<td>${requestScope.firstFlight.arrivalTime }</td>
					<td>Cancelled</td>
					<td>$${requestScope.firstFlightFare}</td>
				</tr>
			</table>
			</div>
		<%
			if (request.getAttribute("secondFlight") != null) {
		%>
		<div class="flightDetails">
		<p class="ticketDetails">Sector: ${requestScope.secondFlight.sectorId }</p>
			<table>
				<tr class="tableHeader">
					<th>Flight #:</th>
					<th>Class:</th>
					<th>Date:</th>
					<th>Dep. Time:</th>
					<th>Arr. Time:</th>
					<th>Status:</th>
					<th>Price:</th>
				</tr>
				<tr>
					<td>${requestScope.reservedFlight2.flightNo }</td>
					<td>${requestScope.reservedFlight2.seatClass }</td>
					<td>${requestScope.reservedFlight2.flightDate }</td>
					<td>${requestScope.secondFlight.departureTime }</td>
					<td>${requestScope.secondFlight.arrivalTime }</td>
					<td>Cancelled</td>
					<td>$${requestScope.secondFlightFare}</td>
				</tr>
			</table>
		
		<%
					}
				%>
		
		</div>
		</div>
	
	
	
	</div>
	
	
	<div class="footer">
		<input type="submit" id="print" value="Print receipt" />
	</div>
	<div class="footer">
	<a href="./index.jsp">Back to home page</a>
<script src="js/ticket.js"></script>
	
	

</body>
</html>