package controller;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class ServiceListServlet
 */
@WebServlet("/list/searchResultPage")
public class ServiceListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter(); // 
		ServiceAreaDAO dao = new ServiceAreaDAO();
		List<ServiceAreaVO> servicelist = dao.selectAllArea();
		request.setAttribute("servicelist", servicelist);
		RequestDispatcher rd = request.getRequestDispatcher("searchResultPage.jsp");
		rd.forward(request, response);
		
		
	}

	

}
