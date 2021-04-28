package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserDAO;
import model.UserVO;

/**
 * Servlet implementation class ChangeListByUserServlet
 * http://localhost:9090/whereAreHU/mypage/changeByUserList?user_id= 404
 */
@WebServlet("/mypage/changeByUserList")
public class ChangeListByUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		UserVO user = new UserVO();
		//user.setUser_email(request.getParameter("user_email"));
		user.setUser_id(request.getParameter("user_id"));
		//user.setUser_name(request.getParameter("user_name"));
		//user.setUser_phone(request.getParameter("user_phone"));
		//user.setUser_pw(request.getParameter("user_pw"));

		RequestDispatcher rd = request.getRequestDispatcher("jsp/chg_listForUser.jsp");
		rd.forward(request, response);
		
	}
}