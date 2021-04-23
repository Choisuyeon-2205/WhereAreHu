package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginChkFilter
 */
@WebFilter({ "/user/*", "/reviewInsert" })
public class LoginChkFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginChkFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpSession sess = ((HttpServletRequest)request).getSession(); // review창에 get요청으로 들어올 시 이미 로그인 상태인지 session 체크
		String path = ((HttpServletRequest)request).getRequestURI();
		
		//myPage나 Review 작성 시에 로그인이 안돼있으면 강제 로그인창 보내는 필터
		if (sess.getAttribute("user_id") == null) {
			((HttpServletResponse)response).sendRedirect("/user/loginChk");
			return;
		} 
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
