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
import model.ServiceAreaDAO;
import model.ServiceAreaVO;

/**
 * Servlet implementation class DetailServlet
 */
@WebServlet("/detail/selectDetail")
public class DetailMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String area_num="000485";
		ServiceAreaDAO saDAO = new ServiceAreaDAO();
		ReviewDAO reDAO = new ReviewDAO();
		List<ReviewVO> reviewlist = reDAO.selectAllReviewsByRestStop(area_num);
		System.out.println(reviewlist);
		
		request.setAttribute("area_num", area_num);
		request.setAttribute("sarea", saDAO.selectOneArea(area_num));
		request.setAttribute("reviewlist", reviewlist);
	
		ReviewDAO dao = new ReviewDAO();
//		String area_num = request.getParameter("area_num");
		List<ReviewVO> rlist = dao.selectAllReviewsByRestStop(area_num);
		request.setAttribute("revlist", rlist);
		System.out.println(rlist);
		
		RequestDispatcher rd = request.getRequestDispatcher("detailMain.jsp");
		rd.forward(request, response);
		
		RequestDispatcher rd2 = request.getRequestDispatcher("../review/rev_list.jsp");
		rd2.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
