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

/**
 * Servlet implementation class LoginKakaoServlet
 */
@WebServlet("/user/loginKakao")
public class LoginKakaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String kakaonick = request.getParameter("kakaonick");
		String kakaoemail = request.getParameter("kakaoemail");
		HttpSession sess = request.getSession();
		
		sess.setAttribute("kakaonick", kakaonick);
		sess.setAttribute("kakaoemail", kakaoemail);
		
		RequestDispatcher rd = request.getRequestDispatcher("../user/Login.jsp");
		rd.forward(request, response);
		
	}

}
