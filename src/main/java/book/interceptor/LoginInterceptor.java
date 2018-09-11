package book.interceptor;

import book.bean.Admin;
import book.bean.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @ProjectName AirlineSell
 * @ClassName null.java
 * @Author cza
 * @Time 2018/8/6 0006 15:19
 * @Version 1.0
 * @mark null
 * @Description
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        //获得请求的URL
        String url = httpServletRequest.getRequestURI();
        if (url.contains("/userLogin.do")||url.contains("/userCheckLogin.do")||url.contains("/selectAllBooks.do")||url.contains("/selectBbyName.do")||url.contains("/addUser.do")||url.contains("/showBookDetail.do")) {
            return true;
        }
        HttpSession session = httpServletRequest.getSession();
        if (session.getAttribute("admin")!=null) {
                //System.err.println("###############################################拦截器"+session);
            Admin admin = (Admin) session.getAttribute("admin");
                //System.err.println("###############################################拦截器"+session.getAttribute("admin"));
                //如果有用户数据，则返回true,继续向下执行
            if (admin != null) {
                return true;
            }
            //不合条件的给现提示信息，并转发到页面
            httpServletRequest.setAttribute("msg", "您还没登录，请先登录！");
            httpServletRequest.getRequestDispatcher("/adminLogin.jsp").forward(httpServletRequest, httpServletResponse);
            return false;
        } else if (session.getAttribute("user")!=null) {
            User user = (User) session.getAttribute("user");
            if (user != null) {
                return true;
            }
            System.err.println("###############################################"+user);
            //不合条件的给现提示信息，并转发到页面
            httpServletRequest.setAttribute("msg", "您还没登录，请先登录！");
            httpServletRequest.getRequestDispatcher("/userLogin.jsp").forward(httpServletRequest, httpServletResponse);
            return false;
        }
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin != null) {
            return true;
        }
        User user = (User) session.getAttribute("user");
        if (user != null) {
            return true;
        }
        httpServletRequest.setAttribute("msg", "您还没登录，请先登录！");
        httpServletRequest.getRequestDispatcher("/userLogin.jsp").forward(httpServletRequest, httpServletResponse);
        //httpServletRequest.getRequestDispatcher("/adminLogin.jsp").forward(httpServletRequest, httpServletResponse);
        //妥协对所有请求都分开拦截
        return false;


    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
