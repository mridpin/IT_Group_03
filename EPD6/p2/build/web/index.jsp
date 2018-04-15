
<%@taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Formulario</title>
        <meta charset="windows-1252">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <s:head/>
    </head>
    <body>
        <h1>Formulario de registro Parque de Atracciones</h1>
        <s:form action="/actions/Registro.action" method="post" validate="true">
            <s:textfield name="nombre" key="nombre"/>
            <s:textfield name="apellidos" key="apellidos"/>
            <s:textfield name="dni" key="dni"/>
            <s:textfield name="email" key="email"/>
            <s:password name="contrasenia" key="contrasenia"/>
            <s:textfield name="peso" key="peso"/>
            <s:textfield name="altura" key="altura"/>
            <s:textfield name="edad" key="edad"/>
            <s:textfield name="paginaWeb" key="paginaWeb"/>
            <s:textfield name="date" key="date"/>
            <s:textfield name="precio"  key="precio"/>
            <s:textfield name="tarjeta" key="tarjeta"/>
            <s:submit name="enviar"/>
        </s:form>
    </body>
</html>
