<%-- 
    Document   : index
    Created on : Apr 15, 2018, 2:00:11 PM
    Author     : ridao
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    public Cookie findCookie(String name, Cookie[] cookies) {
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals(name)) {
                    return c;
                }
            }
        }
        return null;
    }
%>
<%
    if (request.getParameter("submit") != null) {
        try {
            webservices.SingleSignOn_Service service = new webservices.SingleSignOn_Service();
            webservices.SingleSignOn port = service.getSingleSignOnPort();
            // TODO initialize WS operation arguments here
            java.lang.String user = request.getParameter("user");
            java.lang.String pass = request.getParameter("pass");
            // TODO process result here
            java.lang.String result = port.login(user, pass);
            Cookie cookie = new Cookie("user", result);
            response.addCookie(cookie);
        } catch (Exception ex) {
            // TODO handle custom exceptions here
        }
        response.sendRedirect("login.jsp");
    }

    Cookie cookie = findCookie("user", request.getCookies());
    if (cookie != null) {
        boolean result = false;
        try {
            webservices.SingleSignOn_Service service = new webservices.SingleSignOn_Service();
            webservices.SingleSignOn port = service.getSingleSignOnPort();
            // TODO initialize WS operation arguments here
            java.lang.String token = cookie.getValue();
            // TODO process result here
            result = port.isAlive(token);
        } catch (Exception ex) {
            // TODO handle custom exceptions here
        }
        if (result) {
            response.sendRedirect("login.jsp");
        }
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IT GROUP 07 - EPD07 P7</title>
    </head>
    <body>
        <h1>IT GROUP 07 - EPD07 P7</h1>
        <article>
            <h2>INDEX</h2>
            <form method="post" action="index.jsp">
                <label>Usuario</label><input type="text" name="user" >
                <label>Contraseña</label><input type="password" name="pass" >
                <input type="submit" name="submit">
            </form>
        </article>
    </body>
</html>
