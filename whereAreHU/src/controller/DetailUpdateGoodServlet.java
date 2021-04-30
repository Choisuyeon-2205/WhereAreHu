package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import model.GoodDAO;

/**
 * Servlet implementation class DetailUpdateGoodServlet
 */
@WebServlet("/detail/updateGood")
public class DetailUpdateGoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		GoodDAO goodDAO= new GoodDAO();
		String user_id= request.getParameter("user_id");
		String area_num= request.getParameter("area_num");
		
		int result= goodDAO.updateGood(user_id, area_num);
	
		if(result==1) {
			out.print(goodDAO.selectByAreaNum(area_num));
		}else {
			System.out.println("좋아요 실패");
		}
	}

}
