package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserDAO;
import model.UserVO;

/**
 * Servlet implementation class LoginKakaoServlet
 */
@WebServlet("/user/loginKakao")
public class LoginKakaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		String user_name = request.getParameter("user_name");
		UserVO user= new UserVO();
		user.setUser_id(user_id);
		user.setUser_name(user_name);
		user.setUser_pw("0000");
		UserDAO	userDAO= new UserDAO();
		int result= userDAO.join(user);
		
		if(result>0) {
			System.out.println("가입완료!");
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("../list/mainPage.jsp");
		rd.forward(request, response);
		
	}

}
