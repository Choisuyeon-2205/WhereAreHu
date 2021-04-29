package controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.ReviewDAO;
import model.ReviewVO;
import util.ConvertUtil;

/**
 * Servlet implementation class ReviewInsertServlet
 */
@WebServlet("/review/reviewInsert")
public class ReviewInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String encoding = "utf-8";
		String UPLOAD_DIR = "upload"; 
		int size = 1024 * 1024 * 10; // 파일 사이즈 설정 : 10M

		String path = getServletContext().getRealPath(UPLOAD_DIR); //upload 폴더의 실제 퍼블리싱 경로 얻음
		File currentDirPath = new File(path);
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(currentDirPath);
		factory.setSizeThreshold(size);
		File uploadFile = null; //upload할 파일 객체 생성
		String fileName = null; //upload할 파일 이름 생성
		ServletFileUpload upload = new ServletFileUpload(factory);
		ReviewVO rev = new ReviewVO();
		try {
			List items = upload.parseRequest(request); //요청을 List 형태로 parse
			for (int i = 0; i < items.size(); i++) {
				FileItem fileItem = (FileItem) items.get(i);

				if (fileItem.isFormField()) {
					System.out.println(fileItem.getFieldName() + "=" + fileItem.getString(encoding)); //항목의 파일 유형이 form 유형인지 확인

					Field f = ReviewVO.class.getDeclaredField(fileItem.getFieldName()); //ReviewVO 객체의 선언된 자료형을 얻음
					f.setAccessible(true); //private 개체 접근 권한 부여
					String value = fileItem.getString(encoding); //request에서 얻은 항목들을 문자로 얻음 
					if (f.getType().getName() == "double")
						f.set(rev, ConvertUtil.covertDouble(value));
					else if (f.getType().getName() == "int")
						f.set(rev, ConvertUtil.covertInt(value));
					else if (f.getType().getName() == "java.sql.Date")
						f.set(rev, ConvertUtil.covertDate(value));
					else
						f.set(rev, value);

				} else { //form 유형이 아닌 즉 파일일 경우
					System.out.println("파라미터명:" + fileItem.getFieldName());
					System.out.println("파일명:" + fileItem.getName());
					System.out.println("파일크기:" + fileItem.getSize() + "bytes"); 

					if (fileItem.getSize() > 0) { //size가 0이면 즉 파일이 없을 경우엔 null값으로 둠
						int idx = fileItem.getName().lastIndexOf("\\");
						if (idx == -1) {
							idx = fileItem.getName().lastIndexOf("/");
						}
						fileName = fileItem.getName().substring(idx + 1);
						uploadFile = new File(currentDirPath + "\\" + fileName);
						fileItem.write(uploadFile);
					} // end if
				} // end if
			} // end for
			System.out.println(rev);

		} catch (Exception e) {
			e.printStackTrace();
		}
		HttpSession sess = request.getSession();
		
		ReviewDAO dao = new ReviewDAO();
		rev.setPhoto(fileName);
		System.out.println("아이디: " + request.getParameter("user_id"));
		rev.setUser_id((String)sess.getAttribute("user_id"));
		int result = dao.insertReview(rev);
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
