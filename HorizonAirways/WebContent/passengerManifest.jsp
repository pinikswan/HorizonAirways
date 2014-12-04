<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.px1.horizonairways.da.FlightDetailsDA"%>
<%@page import="com.px1.horizonairways.entity.FlightSchedule"%>
<%@page import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.math.BigDecimal" %>
<html>
<head>
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/tableDesign.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<div class="header">
			<div><a href="./index.jsp"><img src="./images/horizonAirwaysLogo.png" alt="logo" width="200px" height="100px"/></a></div>
			<div>
				<c:choose>
					<c:when test="${ empty sessionScope.user}">
						<form action="./login" method="post">
							<table>
								<tr>
									<td><p>User Name</p></td>
									<td><input type="text" name="userName" /></td>
									<td><p>Password</p></td>
									<td><input type="password" name="password" /></td>
									<td><input type="submit" name="submit" value="Log in" /></td>
								</tr>
							</table>
						</form>
					</c:when>
				
					<c:otherwise>
						<div>
							<form action="./logout" method="get">
								<input type="submit" name="logout" value="Log out"/>
							</form>
						</div>
					</c:otherwise>
				
				</c:choose>
			</div>
		</div>
		
		
		<h3> Flight No: ${flightNo } <br/> Flight Date: ${flightDate}</h2>
			<c:choose>
					<c:when test="${ not empty requestScope.passengerList}">
		
		<h3>Passenger List</h3>
        	
        	<table class="flightDetails">
	             <tr>
	               <th>Name</th>
	               <th>Birth Date</th>
	               <th>Gender</th>
	               <th>Mobile Number</th>
	               <th>Email Address</th>
	               <th>Reservation Date</th>
	         	    <th>Action</th>
				 </tr>
			             
	             <c:forEach items="${passengerList}" var="passenger">
	             <tr>
	               <td>${passenger.firstName}&nbsp;${passenger.lastName} </td>
	               <td>${passenger.birthDay}</td>
	               <td>${passenger.gender}</td>
	               <td>${passenger.mobileNo}</td>
	               <td>${passenger.emailAddress}</td>
	               <td>${passenger.formattedDate}</td>
	               <td><a href="./CancelReservation?pnrNo=${passenger.pnr}"><b>View Passenger Details</b></a></td>
	             </tr>
	             </c:forEach>
           </table> 
   	
   	</c:when>
   	<c:otherwise>
   <h2>There are no passengers listed for this flight.</h2>	
   	</c:otherwise>
</c:choose>
</body>
</html>