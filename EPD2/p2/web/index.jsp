<%@page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>
<html>
    <head>
        <title>Grupo 03 EPD2 - EJ2</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        
    <% 
    //If we come from the form, we forward to another page
    if(request.getParameter("enviar")!=null)
    {
        %>
        <jsp:forward page="response.jsp"/>
        <%
    }
    else
    {
    %>    
        
        Elija la pagina de referencia a objetos implicitos que desee visualizar:

        <form action="." method="POST">
            <select name="option">
                <option value="request">Request</option>
                <option value="out">Out</option>
                <option value="response">Response</option>
                <option value="config">Config</option>
                <option value="application">Application</option>
                <option value="session">Session</option>
            </select>
            <br>
            <input type="submit" name="enviar" value="Enviar">    

        </form>
    <%}%>
    </body>
</html>
