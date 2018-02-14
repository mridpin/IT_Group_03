<%-- 
    Document   : index
    Created on : Feb 14, 2018, 4:52:16 PM
    Author     : group03
--%>

<%@page import="java.util.Arrays"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    public static int GENDER_COOKIE = 3;

    public boolean checkSession(HttpSession session, String[] data) {
        return data[0].equals(session.getAttribute("name"))
                && data[1].equals(session.getAttribute("lastname"))
                && data[2].equals(session.getAttribute("gender"));
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
        if (checkSession(session, data)) {
            if (session.getAttribute("gender").equals("hombre")) {
                response.sendRedirect("hombre.jsp");
            } else {
                response.sendRedirect("mujer.jsp");
            }
        } else {
            // Step 2: Create session
            session.setAttribute("name", name);
            session.setAttribute("lastname", lastname);
            session.setAttribute("gender", sex);

//            if (session.getAttribute("gender").equals("hombre")) {
//                response.sendRedirect("hombre.jsp");
//            } else {
//                response.sendRedirect("mujer.jsp");
//            }
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IT - EPD02 - P6</title>
    </head>
    <body>
        <h1>IT - EPD02 - P6</h1>
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
