<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPD1 Problema1</title>
        <%!
            String e;
            %>
    </head>
    
    <body>
        <%

            out.print("Nombre: " + request.getParameter("nombre"));
            out.print("<br>Apellidos: " + request.getParameter("apellidos"));
            out.print("<br>Email: " + request.getParameter("email"));
            
            e = request.getParameter("estudio");

            out.print("<br>Estudio ");%><%=e %>
        <%
            if (e.equals("Si")) {
                out.print("<br>Bloques mas dificiles: " + request.getParameter("siestdudio"));
            } else {
                out.print("<br>Nota que espera tener: " + request.getParameter("noestudio"));
            }

        %>
    </body>
</html>