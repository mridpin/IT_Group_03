<%-- 
    Document   : index
    Created on : Feb 13, 2018, 12:36:34 PM
    Author     : group03
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

    Date creationDate = new Date(session.getCreationTime());
    String id = session.getId();
    Float duration = (float) (new Date().getTime() - creationDate.getTime()) / 1000;
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IT - EPD02 - EJ3</title>
    </head>
    <body>
        <h1>IT - EPD02 - EJ3</h1>
        <h2>SESSION INFO</h2>
        <ul>
            <li>ID de la sesi&oacute;n: <%=id%></li>
            <li>Fecha de creaci&oacute;n: <%=creationDate%></li>
            <li>Duraci&oacute;n: <%=duration%> seconds</li>
        </ul>
        <form method="get" action="invalidate.jsp">
            <input type="submit" name="submit" value="Reset session" />
        </form>
    </body>
</html>
