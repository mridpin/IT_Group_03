<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grupo 03 - EPD05 P1</title>
    </head>
    <body>

        <s:form action="newBook">
            <!--
            list: List from the action class that will hold all of the books in the store.
            listKey: This determines the value tag that all of the option tags will have.
            listValue: This is what will be shown to the user inside the select form.
            -->
            <s:select label="Libros" name="current" list="libros" listKey="isbn" listValue="%{titulo + ' ; ' +  autor + ';' + precio}"/>

            <s:submit value="Select" name="submit"/>

        </s:form>
           
        <!--
        
        If there are some selected books
            -->
        <s:if test="%{selected!=null}">
            <center>
            <table border=1 cellspacing=1 cellpadding=2 width="100%" bgcolor="#FFFFFF">
                <tr>
                    <td><b>Titulo</b></td>
                    <td><b>Autor</b></td>
                    <td><b>Editorial</b></td>
                    <td><b>Precio</b></td>
                    <td><b>Cantidad</b></td>
                    <td></td>
                </tr>
                
                <!--
                
                value:List we will be iterating through
                
                -->
                <s:iterator status="stat" value="selected">

                    <tr>
                        <td><b><s:property value="titulo"/> </b></td>
                        <td><b><s:property value="autor"/> </b></td>
                        <td><b><s:property value="editorial.nombre"/> </b></td>
                        <td><b><s:property value="precio"/> </b></td>
                        <td><b><s:property value="cantidad"/> </b></td>
                        <td></td>
                    </tr>

                </s:iterator>


            </table>
            </center>
        
        <s:form action="buy">

            <s:submit value="Comprar" name="submit"/>

        </s:form>

        </s:if>


    </body>
</html>
