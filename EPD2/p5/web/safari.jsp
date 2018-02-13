<%@page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Safari</title>
    </head>
    <body>
    <%! String language;%>
      
    <% 
        language = request.getHeader("accept-language");
    
        if(language.indexOf("en")!=-1)
        {
          %>
            <h1>You are using Safari</h1>
          <%
        }
        else
    {
    
    %>
        <h1>Estas usando Safari</h1>
    <% }%>    
        
        
    </body>
</html>
