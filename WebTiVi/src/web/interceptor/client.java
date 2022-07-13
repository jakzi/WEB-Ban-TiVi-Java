package web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class client  extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session=request.getSession();
		if(session.getAttribute("taiKhoan")==null)
		{
			response.sendRedirect(request.getContextPath()+"/dang-nhap.htm");
			return false;
		}
		
		System.out.println("Chấp nhận");
		return true;
	}
}
