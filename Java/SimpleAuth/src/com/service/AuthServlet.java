package com.service;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

import com.utils.Security;


/**
 * Created with IntelliJ IDEA.
 * User: akirzyk
 * Date: 07.11.13
 * Time: 16:31
 * To change this template use File | Settings | File Templates.
 */

public class AuthServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);

        String action = request.getParameter("action");
        String login = request.getParameter("login");
        String pass = request.getParameter("pass");

        if(action.equals("login")) {
            if(login.equals("test") && pass.equals("test")) {
                response.addCookie(Security.setCookie("login", "/", login));
                response.addCookie(Security.setCookie("token", "/", Security.calculateToken(login, session.getId())));
            } else {
                response.addCookie(Security.eraseCookie("token", "/"));
            }

        }

        if(action.equals("logout")) {
            response.addCookie(Security.eraseCookie("token", "/"));
        }

        System.out.println(session.getId());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }




}