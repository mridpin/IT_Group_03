<%-- 
    Document   : index
    Created on : 25-abr-2018, 3:49:25
    Author     : EvilMezzen
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Cliente_p5 c = new Cliente_p5();
            List l = new ArrayList();
            l = c.listarLibros();
            for(int i=0;i<l.size();i++){
                %>
                Libro: <%=l.get(i)%>
                        
                <%
            }
        %>
    </body>
</html>
