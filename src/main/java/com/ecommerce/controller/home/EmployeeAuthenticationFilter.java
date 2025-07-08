package com.ecommerce.controller.home;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebFilter("/view/employee/*")
public class EmployeeAuthenticationFilter extends HttpFilter {

    private static final long serialVersionUID = 1L;

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        String contextPath = req.getContextPath();

        // Allow access to login page and login validation
        if (uri.equals(contextPath + "/view/home/CustomerLogin.jsp")
                || uri.equals(contextPath + "/EmployeeLoginValidate")) {
            chain.doFilter(request, response);
            return;
        }

        HttpSession session = req.getSession(false);
        Object customerObj = (session != null) ? session.getAttribute("employee") : null;

        if (customerObj == null) {
            System.out.println("Unauthorized access to: " + uri);
            res.sendRedirect(contextPath + "/view/home/EmployeeLogin.jsp");
        } else {
            chain.doFilter(request, response);
        }
    }
}
