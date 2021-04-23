package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.ReviewDAO;
import model.ReviewVO;

/**
 * Servlet implementation class ReviewInsertServlet
 */
@WebServlet("/reviewInsert")
public class ReviewInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("review/review_insert.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String UPLOAD_DIR ="upload"; //이클립스 내 파일이 업로드 될 폴더 이름
		 int size = 1024 * 1024 * 10; // 파일 사이즈 설정 : 10M
		// DefaultFileRenamePolicy 중복된 이름의 파일이 업로드 될 시 번호를 붙여 파일을 생성해주는 정책
		 String path = getServletContext().getRealPath(UPLOAD_DIR); //이클립스의 경로는 가상 경로이기 때문에 실 경로를 얻어줌
		 System.out.println(path); //실경로 출력
		 //MultipartRequest 객체를 만들어 줌, form으로 받은 request, 실경로, 파일 사이즈, 인코딩, 이름 정책 순
		 MultipartRequest mprequest = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
		 		
		 
		// 전송한 전체 파일이름들을 가져온다.
		Enumeration files = mprequest.getFileNames();
		String str = (String) files.nextElement();

		// 파일명 중복이 발생했을 때 정책에 의해 뒤에 1,2,3 처럼 숫자가 붙어 고유 파일명을 생성한다.
		// 이때 생성된 이름을 FilesystemName이라고 하여 그 이름 정보를 가져온다. (중복 처리)
		String fileName = mprequest.getFilesystemName(str);
		System.out.println(fileName);
		// 실제 파일 이름을 가져온다.
		//String originalFileName = mprequest.getOriginalFileName(str);
		//System.out.println(originalFileName);
		
		ReviewVO rev = new ReviewVO();
		//rev.setArea_num(mprequest.getParameter("area_num"));
		//rev.setUser_id(mprequest.getParameter("user_id"));
		rev.setArea_num("000485"); //service_area area_num parent key 제약조건
		rev.setUser_id("test1"); //user_tb user_id parent key 제약조건
		rev.setReview(mprequest.getParameter("review"));
		rev.setRate(Double.parseDouble(mprequest.getParameter("rate")));
		rev.setPhoto(fileName);
		
		ReviewDAO dao = new ReviewDAO();
		int result = dao.insertReview(rev);
		
		
		request.setAttribute("review", rev);
		RequestDispatcher rd = request.getRequestDispatcher("review/reviewMain.jsp");
		rd.forward(request, response);
	}

}
