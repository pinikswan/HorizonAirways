package com.px1.horizonairways.servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.px1.horizonairways.daimpl.ReservationDA;
import com.px1.horizonairways.entity.FlightDetails;
import com.px1.horizonairways.entity.FlightId;
import com.px1.horizonairways.entity.Passenger;
import com.px1.horizonairways.entity.ReservedFlight;
import com.px1.horizonairways.service.FlightReservationService;

/**
 * Servlet implementation class CancelReservationServlet
 */
public class CancelReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CancelReservationServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		FlightReservationService service = new FlightReservationService();
		ReservationDA da = new ReservationDA();
		service.setDa(da);
		String pnrNo = request.getParameter("pnrNo");
		Passenger passenger = service.getPassengerDetailsByPNR(pnrNo);	
		List<ReservedFlight> reservedFlights = service.getAllReservedFlights(pnrNo);
		request.setAttribute("passenger", passenger);
		if(request.getParameter("flightNo")!=null && reservedFlights.size() != 0){
			
			service.cancelReservation(pnrNo);
			FlightId flightId = new FlightId(reservedFlights.get(0).getFlightNo(), reservedFlights.get(0).getFlightDate());
			FlightDetails firstFlight = service.getFlightDetailsById(flightId);
		Map<String, BigDecimal> flightFareMap = service.getFlightFareBySectorId(firstFlight.getSectorId());
		
		
		BigDecimal firstFlightFare = flightFareMap.get(reservedFlights.get(0).getSeatClass().trim());
	
		request.setAttribute("firstFlight", firstFlight);
		request.setAttribute("reservedFlight1", reservedFlights.get(0));
		request.setAttribute("firstFlightFare", firstFlightFare);	
	
		
		if(reservedFlights.size()>1){
			BigDecimal secondFlightFare = flightFareMap.get(reservedFlights.get(1).getSeatClass().trim());
			request.setAttribute("secondFlightFare", secondFlightFare);
			flightId = new FlightId(reservedFlights.get(1).getFlightNo(), reservedFlights.get(1).getFlightDate());
			FlightDetails secondFlight = service.getFlightDetailsById(flightId);
			request.setAttribute("secondFlight", secondFlight);
			request.setAttribute("reservedFlight2", reservedFlights.get(1));
		
		}
	
		
		request.getRequestDispatcher("./cancelcompletion.jsp").forward(request, response);
		}
		
	else {
		
		
		request.setAttribute("reservedFlights", reservedFlights);
		request.getRequestDispatcher("./cancel.jsp").forward(request, response);}
		
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
