<%-- 
    Document   : logout
    Created on : Feb 14, 2018, 5:45:18 PM
    Author     : ridao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
