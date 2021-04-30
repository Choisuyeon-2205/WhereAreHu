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
import util.ConvertUtil;

/**
 * Servlet implementation class ReviewDeleteServlet
 */
@WebServlet("/review/reviewDelete")
public class ReviewDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int review_id = ConvertUtil.covertInt(request.getParameter("review_id"));
			ReviewDAO dao = new ReviewDAO();
			int result = dao.deleteReviewByReviewID(review_id);
			if (result > 0) {
				List<ReviewVO> rlist = dao.selectAllReviewsByRestStop(request.getParameter("area_num"));
				request.setAttribute("revlist", rlist);
				RequestDispatcher rd = request.getRequestDispatcher("rev_list.jsp");
				rd.forward(request, response);
			}
			
		}
}
