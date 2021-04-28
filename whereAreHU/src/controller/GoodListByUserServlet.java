package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.GoodDAO;
import model.GoodVO;
import model.ServiceAreaVO;

/**
 * Servlet implementation class GoodListByUserServlet
 */
@WebServlet("/mypage/GoodByUserList")
public class GoodListByUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GoodDAO dao = new GoodDAO();
		String user_id = request.getParameter("user_id");
		System.out.println(user_id);
		
		List<ServiceAreaVO> glist = dao.selectByUserId(user_id);
		request.setAttribute("arealist", glist);
		System.out.println(glist);
		
		RequestDispatcher rd = request.getRequestDispatcher("jsp/good_listForUser.jsp");
		rd.forward(request, response);
	}

}
