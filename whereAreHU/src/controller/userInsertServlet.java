package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserDAO;
import model.UserVO;

@WebServlet("/user/userInsert")
public class userInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		UserDAO dao= new UserDAO();
		RequestDispatcher rd= request.getRequestDispatcher("userinsert.jsp");
		rd.forward(request, response);
		
	}

	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_name = request.getParameter("user_name");
		String user_phone = request.getParameter("user_phone");
		String user_email = request.getParameter("user_email");
		UserVO user= new UserVO(user_id, user_pw,user_name,user_phone,user_email);
		UserDAO dao = new UserDAO();
		int result = dao.join(user);
		request.setAttribute("message", result + "건 입력되었습니다.");
		RequestDispatcher rd = request.getRequestDispatcher("loginok.jsp");
		rd.forward(request, response);
		
		
	}
	private int covertInt(String param) {
		if(param==null || param.trim() =="") return 0;
		return Integer.parseInt(param);
	}

}
	



