package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import javax.websocket.Session;
import model.GoodDAO;
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
		String area_num= (String) request.getParameter("area_num");
		ServiceAreaDAO saDAO = new ServiceAreaDAO();
		ReviewDAO reDAO = new ReviewDAO();
		GoodDAO goodDAO= new GoodDAO();
		int like_num= goodDAO.selectByAreaNum(area_num);
		
		HttpSession session = request.getSession(true);
		String user_id= (String) session.getAttribute("user_id");
		int like_me= goodDAO.selectByOne(user_id, area_num);
		List<ReviewVO> reviewlist = reDAO.selectAllReviewsByRestStop(area_num);
		
		request.setAttribute("area_num", area_num);
		request.setAttribute("sarea", saDAO.selectOneArea(area_num));
		request.setAttribute("reviewlist", reviewlist);
		request.setAttribute("like_num", like_num);
		request.setAttribute("like_me", like_me);
		
		RequestDispatcher rd = request.getRequestDispatcher("detailMain.jsp");
		rd.forward(request, response);

	}
}
