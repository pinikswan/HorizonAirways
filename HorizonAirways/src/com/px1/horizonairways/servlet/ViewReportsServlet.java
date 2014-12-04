package com.px1.horizonairways.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.px1.horizonairways.da.FlightDetailsDA;
import com.px1.horizonairways.daimpl.ReservationDA;
import com.px1.horizonairways.entity.FlightDetails;
import com.px1.horizonairways.service.FlightReservationService;


public class ViewReportsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ViewReportsServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
		FlightReservationService service = new FlightReservationService();
		ReservationDA da = new ReservationDA();
		service.setDa(da);
		List<FlightDetails> flightDetailsList = service.getAllFlightDetails();
		request.setAttribute("flightDetailsList", flightDetailsList);
		request.getRequestDispatcher("./reports.jsp").forward(request, response);
	
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
