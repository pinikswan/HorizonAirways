package com.px1.horizonairways.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.px1.horizonairways.daimpl.ReservationDA;
import com.px1.horizonairways.entity.FlightId;
import com.px1.horizonairways.entity.Passenger;
import com.px1.horizonairways.service.FlightReservationService;

/**
 * Servlet implementation class PassengerManifest
 */
public class PassengerManifest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PassengerManifest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String flightNo = (String) request.getParameter("flightNo");
		
		SimpleDateFormat format = new SimpleDateFormat("yyy-MM-dd");
		Date flightDate = null;
		try {
			flightDate = format.parse(request.getParameter("flightDate"));
		} catch (ParseException e) {

			e.printStackTrace();
		}
		request.setAttribute("flightNo", flightNo);
		request.setAttribute("flightDate", request.getParameter("flightDate"));
		FlightId id = new FlightId(flightNo, flightDate);
		FlightReservationService service = new FlightReservationService();
		ReservationDA da = new ReservationDA();
		service.setDa(da);
		List<Passenger> passengerList = service.getAllPassengersByFlight(id);
		request.setAttribute("passengerList", passengerList);
		request.getRequestDispatcher("./passengerManifest.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
