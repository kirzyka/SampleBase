package com.router;

import com.utils.Security;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * User: akirzyk
 * Date: 07.11.13
 * Time: 18:36
 * To change this template use File | Settings | File Templates.
 */
public class MainFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        Cookie token = null;
        Cookie login = null;

        Cookie[] cookies = request.getCookies();

        for(Cookie cookie : cookies) {
            if(cookie.getName().equals("token")) {
                token = cookie;
            }
            if(cookie.getName().equals("login")) {
                login = cookie;
            }
        }


        if(token != null && login != null && Security.checkToken(
                login.getValue(),
                request.getSession(true).getId(),
                token.getValue())) {
            response.addCookie(Security.setCookie("token", "/", token.getValue()));
        } else {
            response.addCookie(Security.eraseCookie("token", "/"));
        }

        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
