package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.FoodDAO;


/**
 * Servlet implementation class DetailFoodServlet
 */
@WebServlet("/detail/selectDetailFood")
public class DetailFoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String area_num= request.getParameter("area_num");
		FoodDAO food = new FoodDAO();
		
		request.setAttribute("foodlist", food.selectFoodsByArea_num(area_num));
		request.setAttribute("area_name", request.getParameter("area_name"));
		
		RequestDispatcher rd = request.getRequestDispatcher("detailFood.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
