package com.utils;

import javax.servlet.http.Cookie;

/**
 * Created with IntelliJ IDEA.
 * User: akirzyk
 * Date: 07.11.13
 * Time: 18:37
 * To change this template use File | Settings | File Templates.
 */
public class Security {


    public static Boolean checkToken(String login, String sid, String token ) {

        return token.equals(sid + login);
    }


    public static String calculateToken(String login, String sid ) {

        return sid + login;
    }

    public static Cookie setCookie(String strCookieName, String strPath, String value) {
        Cookie cookie = new Cookie(strCookieName, "");
        cookie.setMaxAge(1 * 60);
        cookie.setPath(strPath);
        cookie.setValue(value);
        return cookie;
    }

    public static  Cookie eraseCookie(String strCookieName, String strPath) {
        Cookie cookie = new Cookie(strCookieName, "");
        cookie.setMaxAge(0);
        cookie.setPath(strPath);

        return cookie;
    }

}
