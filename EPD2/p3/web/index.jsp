<%-- 
    Document   : index
    Created on : Feb 14, 2018, 4:52:16 PM
    Author     : group03
--%>

<%@page import="java.util.Arrays"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    public boolean checkCookies(Cookie[] cookies, String[] data) {
        boolean res = true;
        int i = 0;
        while (i < data.length && res) {
            if (!cookies[i + 1].getValue().equals(data[i])) {
                res = false;
            }
            i++;
        }
        return res;
    }
%>

<!DOCTYPE html>
<%

    if (request.getParameter("submit") != null) {
        // Step 1: Get data
        String name = request.getParameter("name");
        String lastname = request.getParameter("lastname");
        String sex = request.getParameter("sex");

        String[] data = new String[]{name, lastname, sex};
        boolean logged = checkCookies(request.getCookies(), data);
        out.write("is data: " + Arrays.toString(data));
        
        if (checkCookies(request.getCookies(), data)) {
            out.write("LOGGED");
        } else {
            // Step 2: Create cookies
            Cookie nameCookie = new Cookie("name", name);
            Cookie lastnameCookie = new Cookie("lastname", lastname);
            Cookie sexCookie = new Cookie("sex", sex);
            // Step 3: Set duration (1 hour)
            nameCookie.setMaxAge(60 * 60);
            lastnameCookie.setMaxAge(60 * 60);
            sexCookie.setMaxAge(60 * 60);
            // Step 4: Send the cookie to response Object
            response.addCookie(nameCookie);
            response.addCookie(lastnameCookie);
            response.addCookie(sexCookie);
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
    </body>
</html>
