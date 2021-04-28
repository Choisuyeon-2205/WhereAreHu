package controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.ResponseWrapper;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.ReviewDAO;
import model.ReviewVO;

/**
 * Servlet implementation class ReviewInsertServlet
 */
@WebServlet("/review/reviewInsert")
public class ReviewInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@ResponseWrapper
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
		
		HttpSession sess = request.getSession(); //���� �Է½� session ��Ű ���� ȸ�� �� �ްԼ� ������ �ҷ��;� �ϱ� ������ Session ��ü ����
		
		ReviewVO rev = new ReviewVO(); //���� �ۼ��� ���� ReviewVO ��ü ����
		//rev.setArea_num(request.getParameter("area_num")); //session�� area_num�� rev�� �Է�
		//rev.setUser_id((String)sess.getAttribute("user_id")); //session�� user_idf�� rev�� �Է�
		rev.setArea_num(mprequest.getParameter("area_num"));
		rev.setUser_id((String)sess.getAttribute("user_id"));
		rev.setReview(mprequest.getParameter("review")); //����ڰ� form �±׷� �ۼ��� ���� ������ rev�� �Է�
		rev.setRate(Double.parseDouble(mprequest.getParameter("rate"))); //����ڰ� ������ ������ rev�� �Է�
		rev.setPhoto(fileName); //����ڰ� ���ε� �� ������ ���� �̸��� rev�� �Է�
		
		ReviewDAO dao = new ReviewDAO(); //DB�� �ش� �����͸� �Է��ϱ� ���� ReviewDAO ��ü ����
		int result = dao.insertReview(rev); //���ݱ��� ���� rev ��ü�� DB�� insert

		if (result > 0) {
			ReviewDAO dao2 = new ReviewDAO();
			List<ReviewVO> rlist = dao2.selectAllReviewsByRestStop(rev.getArea_num());
			request.setAttribute("revlist", rlist);
			RequestDispatcher rd = request.getRequestDispatcher("rev_list.jsp");
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("rev_list.jsp");
			rd.forward(request, response);
		}
	}

}
