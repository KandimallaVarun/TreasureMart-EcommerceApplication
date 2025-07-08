package com.ecommerce.controller.home;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebFilter("/view/admin/*")
public class AdminAuthenticationFilter extends HttpFilter {

    private static final long serialVersionUID = 1L;

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        String contextPath = req.getContextPath();

        // Allow access to login page and login validation
        if (uri.equals(contextPath + "/view/home/AdminLogin.jsp")
                || uri.equals(contextPath + "/AdminLoginValidate")) {
            chain.doFilter(request, response);
            return;
        }

        HttpSession session = req.getSession(false);
        Object customerObj = (session != null) ? session.getAttribute("admin") : null;

        if (customerObj == null) {
            System.out.println("Unauthorized access to: " + uri);
            res.sendRedirect(contextPath + "/view/home/AdminLogin.jsp");
        } else {
            chain.doFilter(request, response);
        }
    }
}
