package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserDAO;

@WebServlet("/user/Confirm")
public class ConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		  UserDAO dao = new UserDAO(); 
		  boolean co;
		  co = dao.confirmID(user_id);
		  PrintWriter  out = response.getWriter();
		  out.print(String.valueOf(co));
				  
	}

}
