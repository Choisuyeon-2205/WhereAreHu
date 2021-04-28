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
@WebServlet("/list/searchResult")
public class ServiceListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String searcharea = request.getParameter("search");
		

		ServiceAreaDAO dao = new ServiceAreaDAO();

		//검색별 조회
		List<ServiceAreaVO> servicesearch = dao.selectSearchArea(searcharea);
		request.setAttribute("servicesearch", servicesearch);
		System.out.println(servicesearch);


		RequestDispatcher rd = request.getRequestDispatcher("searchResultService.jsp");
		rd.forward(request, response);
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
