<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/passenger.css">
<link rel="stylesheet" href="css/header.css">
<title>Passenger Details</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/horizonairways.css"> 
<script>
$(document).ready(function(){
	$("#modalContainer").hide();
	$( ".available.seat").click(function(){
		if($(this).parents(".${requestScope.flightId1}").length){
			$("#firstSeatNo").val($(this).children("div.seatNo").text());
			$("#firstSeatClass").val($(this).children("div.seatClass").text());
			$(".${requestScope.flightId1} .selected.seat").removeClass("selected");
			$(this).addClass("selected");
		}if($(this).parents(".${requestScope.flightId2}").length){
			$("#secondSeatNo").val($(this).children("div.seatNo").text());
			$("#secondSeatClass").val($(this).children("div.seatClass").text());
			$(".${requestScope.flightId2} .selected.seat").removeClass("selected");
			$(this).addClass("selected");
		}

	});
	
	
	$("form .seatPicker").click(function(){
		$("#modalContainer").show();
		$("#seatPlanModal > div:not(:last-child)").hide();
		if($(this).hasClass("first")){
			$("#firstSeatPlan").show();
		}else{
			$("#secondSeatPlan").show();
		}
		
	});
	
	
	$("#seatPlanModal .okButton").click(function(){
		$("#modalContainer").hide();
	});

});
</script>

</head>
<body>
	<div class="header">
		<div><img src="./images/horizonAirwaysLogo.png" alt="logo" width="200px" height="100px"/></div>
		<div>
			<form>
				<input type="submit" name="logout" value="Log out" />
			</form>
		</div>
	</div>

	<form action="./PassengerDetails" method="post">
	<div>
		<h3>Personal Details Form</h3>
		<div>
			<label for="firstName">First Name: </label>
			<input type="text"  name="firstName" id="firstName">
		</div>
		<div>
			<label for="lastName">Last Name: </label>
			<input type="text" name="lastName" id="lastName" >
		</div>
		<div>
			<label for="address">Address: </label>
			<textarea  name="address" id="address"></textarea>
		</div>
		<div>
			<label for="gender">Gender: </label>
			<select name="gender">
				<option value="M">Male</option>
				<option value="F">Female</option>
			</select>
		</div>
		<div>
			<label for="birthDay">Birth Day: </label>
			<input type="date" name="birthDay" id="birthDay">
		</div>
		<div>
			<label for="mobileNo">Mobile Number: </label>
			<input type="text" name="mobileNo" id="mobileNo" >
		</div>
		<div>
			<label for="emailAddress">Email Address: </label>
			<input type="email" name="emailAddress" id="emailAddress">
		</div>
		<div>
			<label for="mealPreference">Meal Preference: </label>
			<select name="mealPreference" id="mealPreference">
				<option value="Non-Vegetarian">Non-Vegetarian</option>
				<option value="Vegetarian">Vegetarian</option>
			</select>
		</div>
		<div>
			<label for="SSR">SSR: </label>
			<input type="text" name="SSR" id="SSR" >
		</div>
		
		<div><h3>Flight: ${firstFlight.flightNo} - ${firstFlight.sectorId}</h3></div>
		<div>
			<label for="firstSeatNo">Seat No: </label>
			<input type="text" name="firstSeatNo" id="firstSeatNo" class="${requestScope.flightId1} seatPicker first" required readonly>
		</div>
		<div>
			<label for="firstSeatClass">Seat Class: </label>
			<input type="text" name="firstSeatClass" id="firstSeatClass" class="${requestScope.flightId1}" required readonly>
		</div>
		
		<% 
			if(session.getAttribute("secondFlight")!=null){
		%>
		
		<div><h3>Flight: ${secondFlight.flightNo} - ${secondFlight.sectorId}</h3></div>
		<div>
			<label for="secondSeatNo">Seat No: </label>
			<input type="text" name="secondSeatNo" id="secondSeatNo" class="${requestScope.flightId2} seatPicker second" required readonly>
		</div>
		<div>
			<label for="secondSeatClass">Seat Class: </label>
			<input type="text" name="secondSeatClass" id="secondSeatClass" class="${requestScope.flightId2}" required readonly>
		</div>
		<% 
			}
		%>
		
		<div><h2>Price:</h2></div>
		<input type="submit" value="Submit" class="submit"/>
	</div>
	</form>
	<div id="modalContainer">
		<div id="seatPlanModal">
			<div id="firstSeatPlan">
				<c:set var="firstSeatPlan" value="${requestScope.firstPassengerSeatPlan}"/>
					<div>
						<div class="area">
							${firstSeatPlan.firstClassHTML}
						</div>
						<div class="area">
							${firstSeatPlan.businessClassHTML}
						</div>
						<div class="area">
							${firstSeatPlan.economyClassHTML}
						</div>
					</div>
			</div>
			<div id="secondSeatPlan">	
				<c:if test="${not empty requestScope.secondPassengerSeatPlan}">
					<c:set var="secondSeatPlan" value="${requestScope.secondPassengerSeatPlan}" />
					<div>
						<div class="area">
						${secondSeatPlan.firstClassHTML}
						</div>
						<div class="area">
						${secondSeatPlan.businessClassHTML}
						</div>
						<div class="area">
						${secondSeatPlan.economyClassHTML}
						</div>
				
					</div>
				</c:if>
			</div>
			<div>
				<input type="button" value="Ok" class="okButton horizonButton" />
			</div>
		</div>	
	</div>
</body>


</html>
