<%-- 
    Document   : index
    Created on : Apr 15, 2018, 12:13:24 PM
    Author     : ridao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%
    Integer sol = 0;
    if (request.getParameter("submit") != null) {
        try {
            webservice.Resta_Service service = new webservice.Resta_Service();
            webservice.Resta port = service.getRestaPort();
            // TODO initialize WS operation arguments here
            java.lang.Integer minuendo = Integer.parseInt(request.getParameter("min"));
            java.lang.Integer substraendo = Integer.parseInt(request.getParameter("sub"));
            // TODO process result here
            sol = port.resta(minuendo, substraendo);
        } catch (Exception ex) {
            // TODO handle custom exceptions here
        }
    }
%>

<html>
    <head>
        <title>EXP3</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>EXP3</h1>
        <form method="get" action=".">
            <label>Minuendo</label><input type="number" name="min" >
            <label>Substraendo</label><input type="number" name="sub" >
            <input type="submit" name="submit">
        </form>
        <p>La solucion es: <%=sol%></p>
    </body>
</html>
