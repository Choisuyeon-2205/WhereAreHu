package controller;

import java.io.IOException;
import java.sql.SQLException;

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
 * Servlet implementation class UserDeleteServlet
 */
@WebServlet("/mypage/Deleteuser")
public class DeleteuserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("jsp/delForm.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		RequestDispatcher rd = null;
		UserDAO dao =new UserDAO();
		String pw2 = (String)request.getParameter("user_pw2");
		String pw = (String)session.getAttribute("user_pw");
		if(pw2.equals(pw) ){
			try {
				System.out.println("비밀번호같음");
				dao.deleteId((String)session.getAttribute("user_id"));
			    session.invalidate();
			    response.sendRedirect("../list/mainPage.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} 
		/*
		 * UserVO user_pw = (UserVO) session.getAttribute("user_pw");
		 * session.getAttribute("user_id");
		 */
		
		}
	}


