<%@page import="p1.p1Jersey"%>
<%@page import="javax.ws.rs.core.GenericType"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Resultado: </h1>
        <br>
        
        <%
            p1Jersey result = new p1Jersey();
            
            out.write(result.getHtml(request.getParameter("palabra")));

        %>
    </body>
</html>
