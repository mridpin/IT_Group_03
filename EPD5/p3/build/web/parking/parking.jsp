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

                    <s:form namespace="/parking" action="editParking" theme="simple">
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
                                    <s:textfield name="matricula" disabled="disabled" value="%{parkingFormatted.matricula}"></s:textfield>                                
                                    </td>
                                    <td>
                                    <s:textfield name="modelo" value="%{parkingFormatted.modelo}"></s:textfield>                                
                                    </td>
                                    <td>
                                    <s:textfield name="entrada" value="%{parkingFormatted.entrada}"></s:textfield>                                
                                    </td>
                                    <td>
                                    <s:textfield name="salida" value="%{parkingFormatted.salida}"></s:textfield>                                
                                    </td>
                                    <td>
                                    <s:textfield name="tiempoPermitido" value="%{parkingFormatted.tiempoPermitido}"></s:textfield>                                
                                    </td>
                                </tr>
                            </table>
                            <br>
                        <s:submit value="Guardar"></s:submit>
                    </s:form>
                </s:if>
                <s:else>
                    <h3>Crear Aparcamientos</h3>
                    <s:form namespace="/parking" action="createParking" theme="simple">
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
                                    <s:textfield name="matricula" value="%{parking.matricula}"></s:textfield>                                
                                    </td>
                                    <td>
                                    <s:textfield name="modelo" value="%{parking.modelo}"></s:textfield>                                
                                    </td>
                                    <td>
                                    <s:textfield name="entrada" value="%{parking.entrada}"></s:textfield>                                
                                    </td>
                                    <td>
                                    <s:textfield name="salida" value="%{parking.salida}"></s:textfield>                                
                                    </td>
                                    <td>
                                    <s:textfield name="tiempoPermitido" value="%{parking.tiempoPermitido}"></s:textfield>                                
                                    </td>
                                </tr>
                            </table>
                            <br>
                        <s:submit value="Guardar"></s:submit>
                    </s:form>
                </s:else>
                <p><strong>Nota:</strong> Para guardar un veh&iacute;culo que no ha salido, introducir <em>-1</em> en <em>salida</em><p>
            </section>
        </article>

    </body>
</html>
