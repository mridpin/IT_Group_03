<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grupo 03 - EPD06 P1</title>
        
        <s:head/>
        
    </head>
    <body>
        <h1>Por favor, introduzca la siguiente informaci&oacute;n para agregar un nuevo libro</h1>
        
        <s:form action="createBook">
            
            <s:textfield name="titulo" label="Título"></s:textfield>
            <s:textfield name="autor" label="Autor"></s:textfield>
            <s:textfield name="precio" label="Precio"></s:textfield>
            <s:textfield name="isbn" label="ISBN"></s:textfield>
            <s:textfield name="editorialid" label="Editorial ID"></s:textfield>
            <s:submit value="Confirmar"></s:submit>
            
        </s:form>
        
        <s:form action="first">

            <s:submit value="Atrás" name="submit"/>

        </s:form>
        
    </body>
</html>
