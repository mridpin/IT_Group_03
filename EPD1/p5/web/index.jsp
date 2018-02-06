<%@page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>
<%!
    String[] parameters = {"Nombre", "Sede Social", "Telefono","Capital Extranjero"};
    String[] isExtranjero = {"Pais","Aportacion en %","Banco en el extranjero"};
    String[] noExtranjero = {"Socio princial","Aportacion socio principal","Avalista"};
    int i;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="index.jsp" method="get">
            
            <% for (i = 0; i < parameters.length; i++) {%>
                <%=parameters[i]%>
                
                <%
                
                if(i==3)
                {%>
                    SI <input type="radio"
                               value="SI" name= <%=parameters[i]%>>
                    NO <input type="radio"
                               value="NO" name= <%=parameters[i]%>>
                <%}
                  else
                    {
                %>
                <input type="text"
                               name= <%=parameters[i]%>>
                <br>
                <% }} %>
                <input type="submit" value="Enviar"
                               size="2">
        </form>
    </body>
</html>
