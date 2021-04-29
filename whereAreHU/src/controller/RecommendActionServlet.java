package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ServiceAreaDAO;
import model.ServiceAreaVO;
import comparator.*;

/**
 * Servlet implementation class RecommendAction
 */
@WebServlet("/recommend/recommendAction")
public class RecommendActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		List<String> regions = new ArrayList(Arrays.asList(request.getParameterValues("region")));
		String method = request.getParameter("etc");
		
		for(int i=0; i<regions.size(); i++) {
			if((regions.get(i)).equals("경기"))
				regions.add("경기도");
			if((regions.get(i)).equals("대전")) {
				regions.add("대전광역시");
				regions.add("대전시");
			}
			if((regions.get(i)).equals("울산"))
				regions.add("울산광역시");
			if((regions.get(i)).equals("충남"))
				regions.add("충청남도");
			if((regions.get(i)).equals("전남"))
				regions.add("전라남도");
			if((regions.get(i)).equals("전북"))
				regions.add("전라북도");
			if((regions.get(i)).equals("충북"))
				regions.add("충청북도");
			if((regions.get(i)).equals("서울"))
				regions.add("서울시");
			if((regions.get(i)).equals("경남"))
				regions.add("경상남도");
		}
		
		ServiceAreaDAO serviceDAO= new ServiceAreaDAO();
		List<ServiceAreaVO> sareas= serviceDAO.selectAddressArea2(regions);

		if(method!=null) {
			if(method.equals("good")) {
				//추천순
				Collections.sort(sareas ,new ServiceAreaGoodComparator());
			} else if(method.equals("size")){
				//크기순 => 주차장 크기로 !
				Collections.sort(sareas ,new ServiceAreaCarComparator());
			}
		}

		request.setAttribute("sareas", sareas);
		request.setAttribute("rlist", regions);
		if(method!=null) request.setAttribute("method", method);
		
		RequestDispatcher rd = request.getRequestDispatcher("recommendResult.jsp");
		rd.forward(request, response);
	}

}
