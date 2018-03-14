<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grupo 03 - EPD05 P1</title>
    </head>
    <body>
        <h1>Libros Comprados</h1>
        
        <center>
        <table border=1 cellspacing=1 cellpadding=2 width="100%" bgcolor="#FFFFFF">
            <tr>
                <td><b>Titulo</b></td>
                <td><b>Autor</b></td>
                <td><b>Editorial</b></td>
                <td><b>Precio</b></td>
                <td><b>Cantidad</b></td>
                <td><b>Subtotal</b></td>
            </tr>
            
             <!--
        
        If there are some selected books (We make sure we didn't get here by mistake)
            -->
            <s:if test="%{#session.isbn!=null}">
            
                <!--
                
                This will hold the final amount of the purchase of all the books
                
                -->
                <s:set var="total" value="0"></s:set>
                <s:iterator status="stat" value="selected">

                    <tr>
                        <td><b><s:property value="titulo"/> </b></td>
                        <td><b><s:property value="autor"/> </b></td>
                        <td><b><s:property value="editorial.nombre"/> </b></td>
                        <td><b><s:property value="precio"/> </b></td>
                        <td><b><s:property value="cantidad"/> </b></td>
                        <td><b><s:property value="precio"/> </b></td>
                    </tr>
                    <s:set var="total" value="%{#total+(precio*cantidad)}"/>   
                </s:iterator>
               
            <tr>
                <td><b>TOTAL</b></td>
                <td><b></b></td>
                <td><b></b></td>
                <td><b></b></td>
                <td><b></b></td>
                <td><b><s:label name="total" theme="simple" value="%{#total}"/></b></td>
            </tr>
            
            <!--
            
            In case the list is empty
            -->
            </s:if><s:else>
                
            <tr>
                <td><b>TOTAL</b></td>
                <td><b></b></td>
                <td><b></b></td>
                <td><b>0</b></td>
                <td></td>
            </tr>
            </s:else>
        </table>
    </center>
        
    </body>
</html>
