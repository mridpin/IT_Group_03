<%@page import="java.util.Enumeration"%>
<%@page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>
<%!
    String[] parameters = {"Nombre", "Sede Social", "Telefono","Capital Extranjero"};
    String[] isExtranjero = {"Pais","Aportacion en %","Banco en el extranjero"};
    String[] noExtranjero = {"Socio princial","Aportacion socio principal","Avalista"};
    String[] selected = {};
    int i;
    Enumeration getParameters;
    String aux,isCapital,paramName,paramValue;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grupo 3 - EPD1 p5</title>
    </head>
    <body>
        <form action="index.jsp" method="get">
            
            <% for (i = 0; i < parameters.length; i++) {%>
                <%=parameters[i]%>
                
                <%-- We include a special case for the radio button, also the names of every input needs to be surrounded by '' so
                that we can get the parameters properly--%>
                <%
                if(i==3)
                {%>
                    SI <input type="radio"
                               value="SI" name= '<%=parameters[i]%>'>
                    NO <input type="radio"
                               value="NO" name= '<%=parameters[i]%>'>
                    
                    <%-- If it's the first time running the program, we don't display null. If it's not the first time running the program
                         we show the values captured from get--%>
                <%}
                  else
                    {

                    aux = (String) request.getParameter(parameters[i]);
                    if(aux==null)
                    {   
                        aux="";
                    }
                %>
                <input type="text"
                              value='<%=aux%>' name= '<%=parameters[i]%>'>
                <br>
                <%-- We get the value from the checkbox and determine which piece of form we need to show, to make the code more efficient,
                     we reuse the code just changing which array we are going to show--%>
                
                <%-- We first check if it's the second time showing the form with a hidden field--%>
                <% }} 
                
                if(request.getParameter("hidden")!=null)
                {%>
                    
                    <table border=1 cellspacing=1 cellpadding=2>
            <%
                Enumeration getParameters = request.getParameterNames();
                while (getParameters.hasMoreElements()) {
                    paramName = (String) getParameters.nextElement();
                    paramValue = (String) request.getParameter(paramName);
                    if(!paramValue.equals("hidden")){
            %>
            <tr>
                <td><%=paramName%></td>
                <td><%=paramValue%></td>
            </tr>
            <% }}%>
        </table>

                <%}
                else
                {
                isCapital = request.getParameter(parameters[parameters.length-1]);

                if(isCapital!=null)
                {

                if(isCapital.equals("SI"))
                {
                    selected = isExtranjero;
                }
                else
                {
                    selected = noExtranjero;
                }
                %><br>
                <%for (i = 0; i < selected.length; i++) {%>
                <%=selected[i]%>
                
                <input type="text"
                               name= '<%=selected[i]%>'>
                <br>
                
                <%}

                %>
                <input type="hidden" name="hidden" value="hidden"> 
                <%}}
                %>
                <br>
                <input type="submit" value="Enviar"
                               size="2">
        </form>
    </body>
</html>
