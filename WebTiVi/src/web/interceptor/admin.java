package web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import web.entity.TaiKhoan;

public class admin  extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session=request.getSession();
		if(session.getAttribute("taiKhoan")==null)
		{
			response.sendRedirect(request.getContextPath()+"/dang-nhap.htm");
			return false;
		}
		TaiKhoan u=new TaiKhoan();
		u=(TaiKhoan)session.getAttribute("taiKhoan");
		if(!u.getPhanQuyen().getMaQ().equals("ad"))
		{
			response.sendRedirect(request.getContextPath()+"/404.htm");
			return false;
		}
		System.out.println("Quản trị viên!");
		return true;
	}

}
