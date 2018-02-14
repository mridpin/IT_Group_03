<%-- 
    Document   : logout
    Created on : Feb 14, 2018, 5:45:18 PM
    Author     : ridao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%    // Delete all cookies and redirect to index
    for (Cookie c : request.getCookies()) {
        c.setMaxAge(0);
    }
    response.sendRedirect("index.jsp");
%>
