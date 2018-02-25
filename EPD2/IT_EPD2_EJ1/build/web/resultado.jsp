
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String email = request.getParameter("email");
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
        %>

        <table border="1" cellspacing="2" cellpadding="2">
            <tr><td>Email: </td> <td><% out.write(email); %></td></tr>
            <tr><td>Nombre de usuario: </td> <td><% out.write(user); %></td>  </tr>
            <tr> <td>Contrase&ntilde;a: </td><td><% out.write(pass);%></td> </tr>
            <tr> <td>getRequestedSessionId(): devuelve el identificador de la sesi&oacute;n del cliente: </td>
             <td><%=request.getRequestedSessionId()%></td> </tr>
            <tr> <td>getSession(): Devuelve la sesi&oacute;n actual asociada a esta solicitud, o si la solicitud no tiene una sesi&oacute;n, crea una.</td> 
             <td><%=request.getSession() %></td> </tr>
            <tr> <td>isRequestedSessionIdValid(): Comprueba si el ID de sesi&oacute;n solicitado sigue siendo v&aacute;lido.</td>
             <td><%= request.isRequestedSessionIdValid() %></td> </tr>
            <tr> <td>getContextPath(): Devuelve una parte de la URI solicitada que inidca el contexto.</td>
             <td><%= request.getContextPath() %></td> </tr>
            <tr> <td>getPathInfo(): Devuelve cualquier informacion del path asociado con la url del cliente.</td>
             <td><%= request.getPathInfo() %></td> </tr>
            <tr> <td>getPathTranslated(): Devuelve cualquier informaci&oacute;n de ruta adicional despu&eacute;s del nombre del servlet pero antes de la cadena de consulta, y la traduce a una ruta real.</td>
             <td><%= request.getPathTranslated() %></td> </tr>
            <tr> <td>getQueryString(): Devuelve la cadena de consulta que est&aacute; contenida en la URL solicitada despu&eacute;s de la ruta.</td>
             <td><%= request.getQueryString() %></td> </tr>
            <tr> <td>getRequestURI(): Devuelve la parte de la URL de esta solicitud desde el nombre del protocolo hasta la cadena de consulta en la primera l&iacute;nea de la solicitud HTTP.</td>
             <td><%= request.getRequestURI() %></td> </tr>
            <tr> <td>getHeaderNames(): Devuelve una enumeraci&oacute;n de todos los nombres de encabezado que contiene esta solicitud.</td>
             <td><%= request.getHeaderNames() %></td> </tr>
            <tr> <td>getMethod(): Devuelve el nombre del m&eacute;todo HTTP con el que se hizo la petici&oacute;n.</td>
                <td><%= request.getMethod() %></td> </tr>
        </table>
    </body>
</html>
