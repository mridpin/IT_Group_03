<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password Generator</title>
    </head>
    <body>
        
        <h1>Contrase&ntilde;a Generada</h1>
        
            <%-- start web service invocation --%><hr/>
    <%
    try {
	webservices.Ejercicio1_Service service = new webservices.Ejercicio1_Service();
	webservices.Ejercicio1 port = service.getEjercicio1Port();
	 // TODO initialize WS operation arguments here
	int length = Integer.parseInt(request.getParameter("length"));
	// TODO process result here
	java.lang.String result = port.generatePassword(length);
	out.println(result);
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- end web service invocation --%><hr/>

        
    </body>
</html>
