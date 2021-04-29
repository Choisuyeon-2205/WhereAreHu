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
		JSONObject jsonObject = new JSONObject();
		PrintWriter out = response.getWriter();
		
		GoodDAO goodDAO= new GoodDAO();
		String user_id= request.getParameter("user_id");
		String area_num= request.getParameter("area_num");
		int insertYn= Integer.valueOf(request.getParameter("insertYn"));
		int result=0;
		if(insertYn==1) {
			result= goodDAO.isGood(user_id, area_num);
		}else {
			result= goodDAO.isNotGood(user_id, area_num);
		}
		if(result==1) {
			jsonObject.put("like", goodDAO.selectByOne(user_id, area_num));
			response.getWriter().write(jsonObject.toJSONString());
		}else {
			System.out.println("좋아요 실패");
		}
	}

}
