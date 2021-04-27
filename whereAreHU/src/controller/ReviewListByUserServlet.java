package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReviewDAO;
import model.ReviewVO;

/**
 * Servlet implementation class ReviewListServlet
 */
@WebServlet("/mypage/reviewByUserList")
public class ReviewListByUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewDAO dao = new ReviewDAO();
		String user_id = request.getParameter("user_id");

		List<ReviewVO> rlist = dao.selectAllReviewsByUser(user_id);
		request.setAttribute("revlist", rlist);
		System.out.println(rlist);
		
		RequestDispatcher rd = request.getRequestDispatcher("jsp/rev_listForUser.jsp");
		rd.forward(request, response);
	}
}
