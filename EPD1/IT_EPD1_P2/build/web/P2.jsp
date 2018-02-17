<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPD1 Problema1</title>
        <%!
            float b1,b2,b3,proyecto,epd,noSupera;
            String e;
        %>    
    </head>

    <body>
        <%
             b1 = Float.parseFloat(request.getParameter("b1"));
             b2 = Float.parseFloat(request.getParameter("b2"));
             b3 = Float.parseFloat(request.getParameter("b3"));
             proyecto = Float.parseFloat(request.getParameter("proyecto"));
             epd = Float.parseFloat(request.getParameter("epd"));

             noSupera = (b1 + b2 + b3) / 3;

            if (noSupera <= 5) {
                proyecto = 0;
                epd = 0;
            }

            out.print("Nombre: " + request.getParameter("nombre"));
            out.print("<br>Apellidos: " + request.getParameter("apellidos"));
            out.print("<br>Email: " + request.getParameter("email"));

            e = request.getParameter("estudio");

            out.print("<br>Estudio ");%><%=e%>
        <%
            if (e.equals("Si")) {
                out.print("<br>Bloques mas dificiles: " + request.getParameter("siestdudio"));
            } else {
                out.print("<br>Nota que espera tener: " + request.getParameter("noestudio"));
            }


        %>
        <table border="1" cellspacing="2" cellpadding="2">
            <tr><td> </td><td>Rendimineto Individual</td></tr>
            <tr><td>Bloques</td><td>Pruebas epd sobre 10</td></tr>
            <tr><td>b1</td><td><%=b1%></td></tr>
            <tr><td>b2</td><td><%=b2%></td></tr>
            <tr><td>b3</td><td><%=b3%></td></tr>
            <tr><td> </td><td>Nota Total sobre 7</td></tr>
            <tr><td> </td><td><%=(b1 * 0.311) + (b2 * 0.155) + (b3 * 0.233)%> </td></tr>
        </table>
        <table border="1" cellspacing="2" cellpadding="2">
            <tr><td>Rendimineto Grupal</td></tr>
            <tr><td>Proyecto sobre 10</td><td>Epd sobre 10</td></tr>
            <tr><td><%=proyecto%> </td><td><%=epd%></td></tr>
            <tr><td>Nota Total sobre 2</td><td>Nota Total sobre 1</td></tr>
            <tr><td> <%=proyecto * 0.2%></td><td><%=epd * 0.1%> </td></tr>
        </table>
        <table border="1" cellspacing="2" cellpadding="2">
            <tr><td>Nota Total</td></tr>
            <tr><td><%=((b1 * 0.311) + (b2 * 0.155) + (b3 * 0.233))+(proyecto * 0.2)+(epd * 0.1)%></td></tr>
        </table>

    </body>
</html>
