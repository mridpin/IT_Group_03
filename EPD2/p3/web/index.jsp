<%-- 
    Document   : index
    Created on : Feb 14, 2018, 4:52:16 PM
    Author     : group03
--%>

<%@page import="java.util.Arrays"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    public static int GENDER_COOKIE = 3;

    public String getCookieValue(Cookie[] cookies, String name) {
        String res = "";
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(name)) {
                res = cookie.getValue();
            }
        }
        return res;
    }

    public boolean checkCookies(Cookie[] cookies, String[] data) {
        boolean res = true;
        if ((cookies.length - 1) != data.length) {
            res = false;
        } else {
            res = data[0].equals(getCookieValue(cookies, "name"))
                    && data[1].equals(getCookieValue(cookies, "lastname"))
                    && data[2].equals(getCookieValue(cookies, "sex"));
        }
        return res;
    }
%>

<!DOCTYPE html>
<%
    // Step 1: Get data
    String name = request.getParameter("name");
    String lastname = request.getParameter("lastname");
    String sex = request.getParameter("sex");
    String[] data = new String[]{name, lastname, sex};

    if (request.getParameter("submit") != null) {
        if (checkCookies(request.getCookies(), data)) {
            if (getCookieValue(request.getCookies(), "sex").equals("hombre")) {
                response.sendRedirect("hombre.jsp");
            } else {
                response.sendRedirect("mujer.jsp");
            }
        } else {
            if (!"".equals(name) && !"".equals(lastname) && sex!=null) {
                Cookie nameCookie = new Cookie("name", name);
                nameCookie.setMaxAge(60 * 60);
                response.addCookie(nameCookie);

                Cookie lastnameCookie = new Cookie("lastname", lastname);
                lastnameCookie.setMaxAge(60 * 60);
                response.addCookie(lastnameCookie);

                Cookie sexCookie = new Cookie("sex", sex);
                sexCookie.setMaxAge(60 * 60);
                response.addCookie(sexCookie);
            } else {
                data = new String[]{"Valores de las cookies no v&aacute;lidos"};
            }
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IT - EPD02 - P3</title>
    </head>
    <body>
        <h1>IT - EPD02 - P3</h1>
        <h2>Fill in form please:</h2>
        <form method="get" action="index.jsp">
            <label>Nombre</label><input type="text" name="name" /><br />
            <label>Apellidos</label><input type="text" name="lastname" /><br />
            <label>Hombre</label><input type="radio" name="sex" value="hombre"/>
            <label>Mujer</label><input type="radio" name="sex" value="mujer"/><br />
            <input type="submit" name="submit" />
        </form>
        <%
            out.write("<br />Current data: " + Arrays.toString(data));
        %>
    </body>
</html>
