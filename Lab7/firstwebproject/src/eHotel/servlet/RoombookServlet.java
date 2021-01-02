package eHotel.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import eHotel.connections.PostgreSqlConn;
import eHotel.entities.Room;
import eHotel.entities.employee;

public class RoombookServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
//		employee account = new employee();
		String custName = req.getParameter("custName");
		String roomno = req.getParameter("roomno");
		
		
		PostgreSqlConn con = new PostgreSqlConn();
		
		String userSSN = con.bookRoom(custName,roomno);
		
//		[0]:name,[1]:pwd
//		String[] pwdfromdb = con.getuserinforbycustSSN(userSSN);
//		
//		
//		
		if (userSSN.length()!=0) {			
			
			ArrayList<Room> bookedRooms = con.getbookedRooms(userSSN);
			
			ArrayList<Room> allRooms = con.getAllAvailRooms();
			
			
			req.setAttribute("CustName", custName);
			req.setAttribute("bookedRooms", bookedRooms);
			req.setAttribute("allRooms", allRooms);

			req.getRequestDispatcher("booking.jsp").forward(req, resp);
			return;	
		}
		resp.sendRedirect("login_failure.jsp");
		return;
	}
}