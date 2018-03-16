<%-- 
    Document   : parking
    Created on : Mar 7, 2018, 7:15:46 PM
    Author     : ridao
--%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Parking</title>
    </head>
    <body>
        <h1><strong>IT - EPD05 - P3 - Grupo03</strong></h1>
        <article>
            <h2>APARCAMIENTOS</h2>
            <section>
                <!-- Conditions in struct
                https://www.mkyong.com/struts2/struts-2-if-elseif-else-tag-example/-->
                <s:set name="isEdit" value="isEdit"/>
                <s:if test="%{#isEdit=='isEdit'}">
                    <h3>Editar Aparcamientos</h3>
                </s:if>
                <s:else>
                    <h3>Crear Aparcamientos</h3>
                </s:else>
                <s:form action="editParking" theme="simple">
                    <table border="1">        
                        <tr>                
                            <th>Matr&iacute;cula</th>
                            <th>Modelo</th>
                            <th>Hora de entrada</th>
                            <th>Hora de salida</th>
                            <th>Tiempo permitido</th>                
                        </tr>                       
                        <tr>                         
                            <td>
                                <s:textfield name="matricula" disabled="disabled" value="%{parking.matricula}"></s:textfield>                                
                                </td>
                                <td>
                                <s:textfield name="modelo" disabled="disabled" value="%{parking.modelo}"></s:textfield>                                
                                </td>
                                <td>
                                <s:textfield name="entrada" disabled="disabled" value="%{parking.entrada}"></s:textfield>                                
                                </td>
                                <td>
                                <s:textfield name="salida" disabled="disabled" value="%{parking.salida}"></s:textfield>                                
                                </td>
                                <td>
                                <s:textfield name="tiempoPermitido" disabled="disabled" value="%{parking.tiempoPermitido}"></s:textfield>                                
                                </td>
                            </tr>
                        </table>
                        <br>
                    <s:submit value="Guardar"></s:submit>
                </s:form>
                <p><strong>Nota:</strong> Para guardar un veh&iacute;culo que no ha salido, introducir <em>-1</em> en <em>salida</em><p>
            </section>
        </article>

    </body>
</html>
