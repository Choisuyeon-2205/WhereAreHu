package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserVO;

/**
 * Servlet implementation class logoutServlet
 */
@WebServlet("/logout")
public class logoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  HttpSession session = request.getSession();
		  ServletContext app = getServletContext();
		  List<UserVO> ulist = (List<UserVO>)app.getAttribute("user_list");
		    if(ulist!=null) {
		    	UserVO user = (UserVO)session.getAttribute("user");
		    	ulist.remove(user);
		    }
		    app.setAttribute("user_list", ulist);
		    session.invalidate();
		    
		    response.sendRedirect("logout");
	
	}

}
