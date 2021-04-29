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
 * Servlet implementation class ChangeListByUserServlet
 * http://localhost:9090/whereAreHU/mypage/changeByUserList?user_id= 404
 */
@WebServlet("/mypage/changeByUserList")
public class ChangeListByUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("jsp/chg_listForUser.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		UserVO user = new UserVO();
		UserDAO dao = new UserDAO();

		String user_id = request.getParameter("user_id");
		String user_email = request.getParameter("user_email");
		String user_phone = request.getParameter("user_phone");
		String user_pw = request.getParameter("user_pw");


		user.setUser_email(user_email);
		user.setUser_id(user_id);
		user.setUser_phone(user_phone);
		user.setUser_pw(user_pw);
		System.out.println(user);
		dao.updateUser(user);

		HttpSession session = request.getSession();
		session.setAttribute("user_id", user_id);
		if (user_email != null && !user_email.equals(""))
			session.setAttribute("user_email", user_email);
		if (user_phone != null && !user_phone.equals(""))
			session.setAttribute("user_phone", user_phone);
		if (user_pw != null && !user_pw.equals(""))
			session.setAttribute("user_pw", user_pw);

		RequestDispatcher rd = request.getRequestDispatcher("MyPage.jsp");
		rd.forward(request, response);

	}
}