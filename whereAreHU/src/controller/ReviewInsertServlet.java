package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
		
		HttpSession sess = request.getSession(); //리뷰 입력시 session 쿠키 내의 회원 및 휴게소 정보를 불러와야 하기 때문에 Session 객체 생성
		
		ReviewVO rev = new ReviewVO(); //리뷰 작성을 위한 ReviewVO 객체 생성
		//rev.setArea_num(request.getParameter("area_num")); //session의 area_num을 rev에 입력
		//rev.setUser_id((String)sess.getAttribute("user_id")); //session의 user_idf를 rev에 입력
		rev.setArea_num("000485");
		rev.setUser_id("test1");
		rev.setReview(mprequest.getParameter("review")); //사용자가 form 태그로 작성한 리뷰 내용을 rev에 입력
		rev.setRate(Double.parseDouble(mprequest.getParameter("rate"))); //사용자가 선택한 별점을 rev에 입력
		rev.setPhoto(fileName); //사용자가 업로드 한 사진의 파일 이름을 rev에 입력
		
		ReviewDAO dao = new ReviewDAO(); //DB에 해당 데이터를 입력하기 위한 ReviewDAO 객체 생성
		int result = dao.insertReview(rev); //지금까지 만든 rev 객체를 DB에 insert
		String area_num="000485";
		
		if (result > 0) {
			response.addHeader("Refresh", "1;url=second");
			ReviewDAO dao2 = new ReviewDAO();
//			String area_num = request.getParameter("area_num");
			List<ReviewVO> rlist = dao2.selectAllReviewsByRestStop(area_num);
			request.setAttribute("revlist", rlist);
			
			RequestDispatcher rd = request.getRequestDispatcher("rev_list.jsp");
			rd.forward(request, response);
		} else {
			PrintWriter out = response.getWriter();
			out.print("등록에 실패했습니다.");
		}
	}

}
