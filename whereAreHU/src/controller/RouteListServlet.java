package controller;

import java.io.IOException;
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
 * Servlet implementation class RouteListServlet
 */
@WebServlet("/RouteListServlet")
public class RouteListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchroute = request.getParameter("");
		
		ServiceAreaDAO dao = new ServiceAreaDAO();
		
		List<String> routelist = dao.selectAllRoute(searchroute);
		request.setAttribute("routelist", routelist);
		System.out.println(routelist);
		
		RequestDispatcher rd = request.getRequestDispatcher("searchResult.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
