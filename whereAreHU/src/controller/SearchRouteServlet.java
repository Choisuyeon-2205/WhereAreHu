package controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ServiceAreaDAO;
import model.ServiceAreaVO;

/**
 * Servlet implementation class SearchRouteServlet
 */
@WebServlet("/list/searchResultRoute")
public class SearchRouteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//String route = request.getParameter("route");

		
		ServiceAreaDAO dao = new ServiceAreaDAO();
		
		List<String> routelist = dao.selectAllRoute();
		request.setAttribute("routelist", routelist);
		System.out.println(routelist);
		
		RequestDispatcher rd = request.getRequestDispatcher("searchResultRoute.jsp");
		rd.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String route = request.getParameter("route");
		String oil = request.getParameter("oil");
		String updown = request.getParameter("updown");
		ServiceAreaDAO dao = new ServiceAreaDAO();
		request.setAttribute("routelist", dao.selectRoutePlus(route, oil, updown));
		RequestDispatcher rd = request.getRequestDispatcher("otherRouteResult.jsp");
		rd.forward(request, response);
	}

}
