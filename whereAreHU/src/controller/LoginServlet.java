package controller;

import java.io.IOException;
import java.io.PrintWriter;

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



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	RequestDispatcher rd;
		rd = request.getRequestDispatcher("Login.jsp");
		rd.forward(request, response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");

	
		UserDAO dao = new UserDAO();
		UserVO user = dao.loginChk(user_id, user_pw);
		PrintWriter out= response.getWriter();
		if(user == null) {
			
			//response.sendRedirect("loginChk");
			//out.println("<script>alert('�α��������� Ȯ�����ּ���') </script>");
			out.println("no");
			
			
		}else {
			request.setAttribute("user", user);
			request.setAttribute("username", user.getUser_name());
			request.setAttribute("user_email", user.getUser_email());
			HttpSession session = request.getSession();
		
			session.setAttribute("user_id", user_id);
			session.setAttribute("user_pw", user_pw);
			
			session.setAttribute(user_pw, session);
			session.setAttribute("user", user);
			session.setAttribute("username", user.getUser_name());
			session.setAttribute("user_phone", user.getUser_phone());
			session.setAttribute("user_email", user.getUser_email());
			out.println("�α��� ����");
			//RequestDispatcher rd;
			// response.sendRedirect("../list/area_MainPage.html");
			
			//rd.forward(request, response);
		}
		
					
		
		
		
	}
	
	
	

}
