


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amazon P4 - EPD 2</title>
        <%
            
        %>
    </head>
    <body>
        <h1>EPD 2 - P4</h1>
        <table> 
                        <tr> 
            <td><jsp:include page="/Computer.html"></jsp:include></td> 
            </tr>
            <tr> 
                <td><jsp:include page="/Videojuego.html"></jsp:include></td> 
            </tr>
            <tr>
                <td><%@include file="/Maquina.html" %></td> 
            </tr> 

        </table>
    </body>
</html>
