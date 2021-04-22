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
		 int size = 1024 * 1024 * 10; // ���� ������ ���� : 10M
		// DefaultFileRenamePolicy ó���� �ߺ��� �̸��� ������ ��� ó���� ��
		 String path = getServletContext().getRealPath(UPLOAD_DIR);
		 System.out.println(path);
		 MultipartRequest mprequest = 
				 new MultipartRequest(request, path, size, "utf-8", 
				 new DefaultFileRenamePolicy());

		// ������ ��ü �����̸����� �����´�.
		Enumeration files = mprequest.getFileNames();
		String str = (String) files.nextElement();

		// ���ϸ� �ߺ��� �߻����� �� ��å�� ���� �ڿ� 1,2,3 ó�� ���ڰ� �پ� ���� ���ϸ��� �����Ѵ�.
		// �̶� ������ �̸��� FilesystemName�̶�� �Ͽ� �� �̸� ������ �����´�. (�ߺ� ó��)
		//String fileName = mprequest.getFilesystemName(str);
		// ���� ���� �̸��� �����´�.
		String originalFileName = mprequest.getOriginalFileName(str);
		System.out.println(originalFileName);
		
		/*String user_id = sessio
		
		ReviewVO review = new ReviewVO();*/
	}

}
