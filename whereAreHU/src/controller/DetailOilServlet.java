package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.OilDAO;


/**
 * Servlet implementation class DetailOilServlet
 */
@WebServlet("/detail/selectDetailOil")
public class DetailOilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String area_name= request.getParameter("area_name");
		int idx= area_name.indexOf("휴");
		area_name= area_name.substring(0, idx);
		System.out.println(area_name);
		OilDAO oilDAO = new OilDAO();
		
		request.setAttribute("oil", oilDAO.selectOilByArea_name(area_name));
		//request.setAttribute("area_name", request.getParameter("area_name"));
		
		RequestDispatcher rd = request.getRequestDispatcher("detailOil.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
