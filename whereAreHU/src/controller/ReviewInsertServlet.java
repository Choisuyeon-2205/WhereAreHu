package controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
		String UPLOAD_DIR ="upload";
		 int size = 1024 * 1024 * 10; // 파일 사이즈 설정 : 10M
		// DefaultFileRenamePolicy 처리는 중복된 이름이 존재할 경우 처리할 때
		 String path = getServletContext().getRealPath(UPLOAD_DIR);
		 System.out.println(path);
		 MultipartRequest mprequest = 
				 new MultipartRequest(request, path, size, "utf-8", 
				 new DefaultFileRenamePolicy());

		// 전송한 전체 파일이름들을 가져온다.
		Enumeration files = mprequest.getFileNames();
		String str = (String) files.nextElement();

		// 파일명 중복이 발생했을 때 정책에 의해 뒤에 1,2,3 처럼 숫자가 붙어 고유 파일명을 생성한다.
		// 이때 생성된 이름을 FilesystemName이라고 하여 그 이름 정보를 가져온다. (중복 처리)
		//String fileName = mprequest.getFilesystemName(str);
		// 실제 파일 이름을 가져온다.
		String originalFileName = mprequest.getOriginalFileName(str);
		System.out.println(originalFileName);
		
		/*String user_id = sessio
		
		ReviewVO review = new ReviewVO();*/
	}

}
