package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.OilDAO;
import model.OilVO;

/**
 * Servlet implementation class SearchOilServlet
 */
@WebServlet("/list/searchResultOil")
public class SearchOilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String oil = request.getParameter("oil_id");

		OilDAO dao = new OilDAO();
		
		List<OilVO> oillist = dao.selectAllOil();
		request.setAttribute("oillist", oillist);
		System.out.println(oillist);
						
		RequestDispatcher rd = request.getRequestDispatcher("searchResultOil.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
