<%@page import="model.Garage"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Parkingspot"%>
<%@page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPD5 - P2 Grupo 3</title>
    </head>
    <body>
    <section>
        <h1>Aparcamientos</h1>
        <table border="1">        
            <tr>                
                <th>Matr&iacute;cula</th>
                <th>Modelo</th>
                <th>Hora de entrada</th>
                <th>Hora de salida</th>
                <th>Tiempo permitido</th>                
            </tr>


                <s:iterator value="parkings" var="parking">
                    <tr>
                        <td>
                            <s:property value="#parking.matricula" />
                        </td>
                        <td>
                            <s:property value="#parking.modelo" />
                        </td>
                        <td>
                            <s:property value="#parking.entrada" />
                        </td>
                        <td>
                            <s:property value="#parking.salida" />
                        </td>
                        <td>
                            <s:property value="#parking.tiempoPermitido" />
                </td>
               
            </tr>
             </s:iterator>
            </table>

        <br />
    </section>
        
        <section>
            <h3>
                Filtros
            </h3>
            <s:form namespace="/filter" action="showOverdue" cssClass="form_inline">
                <s:submit value="Mostrar Excedidos"></s:submit>
            </s:form>
            <s:form namespace="/filter" action="showNotOverdue" cssClass="form_inline">
                <s:submit value="Mostrar No Excedidos"></s:submit>
            </s:form>
            <s:form namespace="/" action="" cssClass="form_inline">
                <s:submit value="Mostrar Todos"></s:submit>
            </s:form>
        </section>
        <section>
            <h3>B&uacute;squedas</h3>
            <s:form namespace="/search" action="searchByPlate" >
                <s:textfield type="text" label="Por matrícula" name="matricula"></s:textfield>
                <s:submit value="Buscar" ></s:submit>
            </s:form>
            <s:form namespace="/search" action="showParked" >                
                <s:submit value="Mostrar vehículos aparcados" ></s:submit>
            </s:form>
        </section>
    </body>
</html>
