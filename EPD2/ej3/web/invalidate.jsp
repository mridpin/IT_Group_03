<%-- 
    Document   : invalidate
    Created on : Feb 13, 2018, 2:10:02 PM
    Author     : ridao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session.invalidate();
    response.sendRedirect("index.jsp"); // Solución encontrada aquí: https://stackoverflow.com/questions/5188737/creating-a-link-to-logout-for-jsp
%>