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
		String UPLOAD_DIR ="upload"; //��Ŭ���� �� ������ ���ε� �� ���� �̸�
		 int size = 1024 * 1024 * 10; // ���� ������ ���� : 10M
		// DefaultFileRenamePolicy �ߺ��� �̸��� ������ ���ε� �� �� ��ȣ�� �ٿ� ������ �������ִ� ��å
		 String path = getServletContext().getRealPath(UPLOAD_DIR); //��Ŭ������ ��δ� ���� ����̱� ������ �� ��θ� �����
		 System.out.println(path); //�ǰ�� ���
		 //MultipartRequest ��ü�� ����� ��, form���� ���� request, �ǰ��, ���� ������, ���ڵ�, �̸� ��å ��
		 MultipartRequest mprequest = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
		 		
		 
		// ������ ��ü �����̸����� �����´�.
		Enumeration files = mprequest.getFileNames();
		String str = (String) files.nextElement();

		// ���ϸ� �ߺ��� �߻����� �� ��å�� ���� �ڿ� 1,2,3 ó�� ���ڰ� �پ� ���� ���ϸ��� �����Ѵ�.
		// �̶� ������ �̸��� FilesystemName�̶�� �Ͽ� �� �̸� ������ �����´�. (�ߺ� ó��)
		String fileName = mprequest.getFilesystemName(str);
		System.out.println(fileName);
		// ���� ���� �̸��� �����´�.
		//String originalFileName = mprequest.getOriginalFileName(str);
		//System.out.println(originalFileName);
		
		ReviewVO rev = new ReviewVO();
		//rev.setArea_num(mprequest.getParameter("area_num"));
		//rev.setUser_id(mprequest.getParameter("user_id"));
		rev.setArea_num("000485"); //service_area area_num parent key ��������
		rev.setUser_id("test1"); //user_tb user_id parent key ��������
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
