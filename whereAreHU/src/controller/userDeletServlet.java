package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserDAO;

/**
 * Servlet implementation class userDeletServlet
 */
@WebServlet("/user/userDelete")
public class userDeletServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_id =request.getParameter("user_id");
		
		UserDAO dao = new UserDAO();
		int result = dao.delete(user_id);
		
		System.out.println(result + "건 삭제");
		request.setAttribute("message", result + "건 삭제되었습니다.");
		
	
		RequestDispatcher rd = request.getRequestDispatcher("resultInfo.jsp");
		rd.forward(request, response);
	}

}
