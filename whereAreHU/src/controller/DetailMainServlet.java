package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ServiceAreaDAO;
import model.ServiceAreaVO;

/**
 * Servlet implementation class DetailServlet
 */
@WebServlet("/detail/selectDetail")
public class DetailMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String area_num="000001";
		ServiceAreaDAO saDAO = new ServiceAreaDAO();
		
		request.setAttribute("sarea", saDAO.selectOneArea(area_num));
		
		RequestDispatcher rd = request.getRequestDispatcher("detailMain.jsp");
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
