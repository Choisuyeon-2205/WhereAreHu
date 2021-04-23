package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserDAO;
import model.UserVO;

@WebServlet("/user/loginChk")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public LoginServlet() { }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	RequestDispatcher rd;
		rd = request.getRequestDispatcher("Login.jsp");
		rd.forward(request, response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		UserVO v = new UserVO();

		UserDAO dao = new UserDAO();
		UserVO user = dao.loginChk(user_id, user_pw);
		if(user == null) {
			response.sendRedirect("loginChk");
			
		}else {
			request.setAttribute("user", user);
			request.setAttribute("username", user.getUser_name());
			HttpSession session = request.getSession();
		
			session.setAttribute("user_id", user_id);
			session.setAttribute("user_pw", user_pw);
			session.setAttribute("user", user);
			session.setAttribute("username", user.getUser_name());
			RequestDispatcher rd;
			 response.sendRedirect("../list/area_MainPage.html");
			//rd.forward(request, response);
		}
		
		
			
			
		
		
		
	}

}
